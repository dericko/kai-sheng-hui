//
//  KSHUserManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
//#import "KSHUser.h"
#import <RestKit/RestKit.h>

/**
 'KSHUserManager' Defines userObject-specific request and response behavior. It handles login authentication requests and responses, and calls an object mapping provider to map network responses to a user model.
 @see 'KSHObjectManager'
 */
@interface KSHUserManager : KSHObjectManager

// TODO: comment mapping methods , implement User model
//- (void) loadAuthenticatedUser:(void (^)(KSHUser *user))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
