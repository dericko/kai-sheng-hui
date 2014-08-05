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
    if (sharedManager) {
        return sharedManager;
    }
    
    // instantiate object manager with base url
    NSURL *url = [NSURL URLWithString:kBASE_URL];
    sharedManager = [self managerWithBaseURL:url];
    
    // Serialize for JSON
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    sharedManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    
    // Setup response descriptors
    [sharedManager setupResponseDescriptors];
    
    // Setup Parse headers
    [sharedManager.HTTPClient setDefaultHeader:@"X-Parse-Application-Id" value:kAppKey];
    [sharedManager.HTTPClient setDefaultHeader:@"X-Parse-REST-API-Key" value:kRestAPIKey];
    
    return sharedManager;
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
//    [self setPathMatcherForPath:@"/1/classes/Project" forEntity:@"Project" withAttributeID:@"entityID"];
    [self setPathMatcherForPath:@"/1/classes/Task" forEntity:@"Task" withAttributeID:@"entityID"];
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
                           [KSHMessage displayErrorAlert:@"There was a problem logging in" withSubtitle:[NSString stringWithFormat:@"%@", error]];
                       }];
                       
                       // Persist the userID for later use in NSUserDefaults
                       NSLog(@"--UserID: %@", currentUser.userID);
                       [[NSUserDefaults standardUserDefaults] setObject:currentUser.userID forKey:kCurrentUserIDKey];
                       [[NSUserDefaults standardUserDefaults] synchronize];
                       
                       // Inform the delegate
                       if ([self.delegate respondsToSelector:@selector(userDidLogin:)]) {
                           [self.delegate userDidLogin:[KSHUser currentUser]];
                       }
                       
                       // Notify a successful login
                       [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLoginNotification object:self];
                       
                   } failure:^(RKObjectRequestOperation *operation, NSError *error) {

                       // Notify a failed login
                       [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginFailedNotification object:self];
                   }];
}

- (void)logoutWithDelegate:(NSObject<UserAuthenticationDelegate> *)delegate
{
    // Remove user from managed object store
    NSManagedObjectContext *managedObjectContext = self.managedObjectStore.mainQueueManagedObjectContext;
    NSError *error = nil;
    if ([KSHUser currentUser]) {
        [managedObjectContext deleteObject:[KSHUser currentUser]];
    }
    [managedObjectContext save:&error];
    if (error) {
        // Handle error
        NSLog(@"Error saving managed object context after removing currentUser. Error message: %@", error);
    }
    
    // Clear the stored credentials
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kCurrentUserIDKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
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
                       
                       // Setup User-Profile relationship
                       KSHProfile *profile = [mappingResult firstObject];
                       [user setUserProfile:profile];
                       
                       // Run success
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
                       
                       // Add projects to user's hasProject relationship
                       NSArray *results = [mappingResult array];
                       NSLog(@" \n\n Projects \n\n %@  \n\n", results);
                       for (KSHProject *project in results) {
                           [user addHasProjectObject:project];
                           NSLog(@"project_added: %@", project.name);
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

- (void)loadTasksForProject:(KSHProject *)project success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    // @see https://www.parse.com/docs/rest#queries-relational for request parameter details
    NSDictionary *parameters = @{
                                 @"where":[NSString stringWithFormat:@"%@%@%@", kTaskParamsHead, project.entityID, kTaskParamsTail]
                                 };
    [self getObjectsAtPath:kTaskPath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
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
