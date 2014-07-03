//
//  KSHLoginManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/3/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginManager.h"
#import "KSHLogin.h"

# warning must add user login path url
NSString * const kLoginPath = @"INSERT_USER_LOGIN_PATH";

@implementation KSHLoginManager

- (void)loginWithEmail:(NSString *)email password:(NSString *)password success:(void (^)(RKMappingResult *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure
{
    KSHLogin *userLogin = [[KSHLogin alloc] init];
    [userLogin setEmail:email];
    [userLogin setPassword:password];
    
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
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider loginMapping]
                                                 method:RKRequestMethodPOST
                                            pathPattern:kLoginPath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:userResponseDescriptor];
}

@end
