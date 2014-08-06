//
//  KSHUserManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/31/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUserManager.h"
#import "KSHMappingProvider.h"

// Constants
NSString *UserDidLoginNotification = @"UserDidLoginNotification";
NSString *UserLoginFailedNotification = @"UserLoginFailedNotification";
NSString *UserDidLogoutNotification = @"UserDidLogoutNotification";

static NSString *kCurrentUserIDKey = @"kCurrentUserIDKey";

// Singleton
static KSHUserManager *sharedManager = nil;

@interface KSHUserManager ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation KSHUserManager

# pragma mark - Object manager Setup

+ (instancetype)sharedManager
{
    // singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    
    return sharedManager;
}

+ (void)setUserToken
{
    if ([KSHUser currentUser]) {
        [sharedManager.HTTPClient setDefaultHeader:kSessionTokenHeader value:[KSHUser currentUser].token];
    }
}

+ (void)removeUserToken
{
    [sharedManager.HTTPClient setDefaultHeader:kSessionTokenHeader value:@""];
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    [self setPathMatcherForPath:kProjectPath forEntity:@"Project" withAttributeID:@"entityID"];
    [self setPathMatcherForPath:kTaskPath forEntity:@"Task" withAttributeID:@"entityID"];
}


- (void)setupResponseDescriptors
{
    RKResponseDescriptor *userResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider userMapping]
                                                                                                method:RKRequestMethodGET
                                                                                           pathPattern:kLoginPath
                                                                                               keyPath:nil // No response prefix for User request
                                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *profileResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider profileMapping]
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:kProfilePath
                                                                                                  keyPath:kResponsePrefix
                                                                                              statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *projectResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider projectMapping]
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:kProjectPath
                                                                                                  keyPath:kResponsePrefix
                                                                                              statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *taskResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider taskMapping]
                                                                                                method:RKRequestMethodGET
                                                                                           pathPattern:kTaskPath
                                                                                               keyPath:kResponsePrefix
                                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    
    [self addResponseDescriptor:userResponseDescriptor];
    [self addResponseDescriptor:profileResponseDescriptor];
    [self addResponseDescriptor:projectResponseDescriptor];
    [self addResponseDescriptor:taskResponseDescriptor];
}

# pragma mark - User Login/Logout Management

- (void)loginWithUsername:(NSString *)username password:(NSString *)password delegate:(NSObject<UserAuthenticationDelegate> *)delegate
{
    // This user manager will implement the delegate methods
    _delegate = delegate;
  
    [self getObjectsAtPath:kLoginPath
                parameters:@{@"username":username, @"password":password}
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
    
                       // The user object has been added to [RKManagedObjectStore defaultStore] thanks to response descriptor. We can now access the current user with [KSHUser currentUser]
                       
                       // Get the User from the mapping result
                       KSHUser *currentUser = [mappingResult firstObject];
                       
                       // Set up user profile
                       [self loadProfileForUser:currentUser success:nil failure:^(NSError *error) {
                           NSLog(@"Error loading profile: %@", [error localizedDescription]);
                       }];
                       
                       // Persist the userID for later use in NSUserDefaults
                       NSLog(@"--UserID: %@", currentUser.userID);
                       [[NSUserDefaults standardUserDefaults] setObject:currentUser.userID forKey:kCurrentUserIDKey];
                       [[NSUserDefaults standardUserDefaults] synchronize];
                       
                       // Add User Session Token header
                       [KSHUserManager setUserToken];
                       
                       // Inform the delegate
                       if ([self.delegate respondsToSelector:@selector(userDidLogin:)]) {
                           [self.delegate userDidLogin:[KSHUser currentUser]];
                       }
                       
                       // Notify a successful login
                       [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLoginNotification object:self];
                       
                   } failure:^(RKObjectRequestOperation *operation, NSError *error) {

                       // Inform the delegate
                       if ([self.delegate respondsToSelector:@selector(userDidLogin:)]) {
                           [self.delegate user:[KSHUser currentUser] didFailToLoginWithError:error];
                       }
                       
                       // Notify a failed login
                       [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginFailedNotification object:self];
                   }];
}

- (void)logoutWithDelegate:(NSObject<UserAuthenticationDelegate> *)delegate
{
    // Clear the stored credentials
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kCurrentUserIDKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // Remove User Session Token header
    [KSHUserManager removeUserToken];
    
    // Inform the delegate
    if ([delegate respondsToSelector:@selector(userDidLogout:)]) {
        [delegate userDidLogout:[KSHUser currentUser]];
    }
    
    [KSHUser logout];
    
    // Notify a successful logout
    [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLogoutNotification object:nil];
}

- (BOOL)isLoggedIn
{
    NSLog(@"User token: %@", [KSHUser currentUser].token);
    return ([KSHUser currentUser].token != nil);
}

# pragma mark - User Items (Profile, Projects, Tasks, etc.)


- (void)loadProfileForUser:(KSHUser *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    // Set up the parameters according to REST API requirements (if using Parse API for testing, you must make a request to the Profile object, and set up a query to only return the specific user's profile. The final API  will likely use the session token to validate the user and fetch the profile).
    // @see https://www.parse.com/docs/rest#queries-relational for request parameter details
    NSDictionary *parameters = @{
                                 @"where":[NSString stringWithFormat:@"%@%@%@", kProfileParamsHead, user.userID, kProfileParamsTail]
                                 };
    [self getObjectsAtPath:kProfilePath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       
                       // Setup User<->Profile relationship
                       KSHProfile *profile = [mappingResult firstObject];
                       [user setUserProfile:profile];
                       [profile setUser:user];
                       
                       // optional success block
                       if (success) {
                           success();
                       }}
                   failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       if (failure) {
                           failure(error);
                       }
                   }];
}

- (void)loadProjectsForUser:(KSHUser *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    // @see https://www.parse.com/docs/rest#queries-relational for request parameter details
    NSDictionary *parameters = @{
                                 @"where":[NSString stringWithFormat:@"%@%@%@", kProjectParamsHead, user.userID, kProjectParamsTail]
                                 };
    [self getObjectsAtPath:kProjectPath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       
                       // Set User<->>Project relationship
                       NSArray *results = [mappingResult array];
                       NSLog(@" \n\n Projects: \n %@  \n\n", results);
                       for (KSHProject *project in results) {
                           [user addHasProjectObject:project];
                           [project setOfUser:user];
                           NSLog(@"project added: %@", project.name);
                       }
                       
                       // optional success block
                       if (success) {
                           success();
                       }}
                   failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       if (failure) {
                           failure(error);
                       }
                   }];
}

- (void)loadTasksForProject:(KSHProject *)project success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    // @see https://www.parse.com/docs/rest#queries-relational for request parameter details
    NSDictionary *parameters = @{
                                 @"where":[NSString stringWithFormat:@"%@%@%@", kTaskParamsHead, project.entityID, kTaskParamsTail]
                                 };
    [self getObjectsAtPath:kTaskPath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       
                       // Set Project<->>Task relationship
                       NSArray *results = [mappingResult array];
                       NSLog(@" \n\n Tasks: \n %@  \n\n", results);
                       for (KSHTask *task in results) {
                           [project addHasTaskObject:task];
                           [task setOfProject:project];
                           NSLog(@"task added: %@", task.name);
                       }

                       if (success) {
                           success();
                       }}
                   failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       if (failure) {
                           failure(error);
                       }
                   }];
}

@end
