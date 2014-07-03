//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"

NSString * const kArticlePath = @"/post/rest/gettopposts/15";

@implementation KSHArticleManager
// TODO: implement KSHArticleManager methods

- (void)loadArticles:(void (^)(void))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;
{
    [self getObjectsAtPath:kArticlePath parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            success();
        }    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    // additional request descriptors
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
    NSLog(@"-setUpResponseDescriptors: part of singleton--should only call once");
    
    // add additional response descriptors
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kArticlePath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
