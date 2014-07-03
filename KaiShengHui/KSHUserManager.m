//
//  KSHUserManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUserManager.h"
#import <RestKit/RestKit.h>

# warning must add user login path url
NSString * const kUserLogInPath = @"INSERT_USER_LOG_IN_PATH";

@implementation KSHUserManager

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    // additional request descriptors
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
    // add additional response descriptors
    RKResponseDescriptor *userResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider userMapping]
                                                 method:RKRequestMethodPOST
                                            pathPattern:kUserLogInPath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:userResponseDescriptor];
}

// TODO: implement KSHUserManager methods

//- (void) loadAuthenticatedUser:(void (^)(KSHUser *user))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure

// implement user authentication


@end
