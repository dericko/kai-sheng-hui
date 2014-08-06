//
//  KSHUserManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/31/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import "KSHUser.h"
#import "KSHProfile.h"
#import "KSHProject.h"
#import "KSHTask.h"

extern NSString const *UserDidLoginNotification;
extern NSString const *UserDidLogoutNotification;
extern NSString const *UserLoginFailedNotification;

@protocol UserAuthenticationDelegate;

@interface KSHUserManager : KSHObjectManager

@property (nonatomic, assign) NSObject<UserAuthenticationDelegate> *delegate;

+ (instancetype)sharedManager;

# pragma mark - User Login/Logout Management

- (void)loginWithUsername:(NSString *)username password:(NSString *)password delegate:(NSObject<UserAuthenticationDelegate> *)delegate;

- (void)logoutWithDelegate:(NSObject<UserAuthenticationDelegate> *)delegate;

- (BOOL)isLoggedIn;

# pragma mark - User Items (Profile, Projects, Tasks, etc.)

- (void)loadProfileForUser:(KSHUser *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

- (void)loadProjectsForUser:(KSHUser *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

- (void)loadTasksForProject:(KSHProject *)project success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

@end

# pragma mark - Protocol Declaration

@protocol UserAuthenticationDelegate <NSObject>

@optional

- (void)userDidLogin:(KSHUser *)user;

- (void)user:(KSHUser *)user didFailToLoginWithError:(NSError *)error;

- (void)userDidLogout:(KSHUser *)user;

@end