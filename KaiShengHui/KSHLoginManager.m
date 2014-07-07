//
//  KSHLoginManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/3/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginManager.h"

# warning must add user login path url
NSString * const kLoginPath = @"INSERT_USER_LOGIN_PATH";

@implementation KSHLoginManager

- (void)loginWithEmail:(KSHLogin *)userLogin success:(void (^)(RKMappingResult *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure
{
    [self postObject:userLogin
                path:kLoginPath
          parameters:nil
             success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                 if (success) {
                     success(mappingResult);
                 }}
             failure:^(RKObjectRequestOperation *operation, NSError *error) {
                 if (failure) {
                     failure(operation, error);
                 }
             }];
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
    // add additional response descriptors
    RKResponseDescriptor *userResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider loginRequestMapping]
                                                 method:RKRequestMethodPOST
                                            pathPattern:kLoginPath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:userResponseDescriptor];
}

@end
