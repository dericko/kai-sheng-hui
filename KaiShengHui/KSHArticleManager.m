//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"



@interface KSHArticleManager()
@end

static KSHArticleManager *sharedManager = nil;

@implementation KSHArticleManager

+ (instancetype)sharedManager
{
    // singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    
    return sharedManager;
}

- (void)loadContentWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    [self getObjectsAtPath:kArticlePath
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

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    [self setPathMatcherForPath:kArticlePath forEntity:@"Article" withAttributeID:@"postID"];

}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
# warning Using test database on Parse.com: change 'articleParseMapping' to 'articleMapping' for production
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kArticlePath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
