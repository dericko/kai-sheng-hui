//
//  KSHEventManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventManager.h"

static KSHEventManager *sharedManager = nil;

@implementation KSHEventManager

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
    [self getObjectsAtPath:kEventPath
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
        
    [self setPathMatcherForPath:kEventPath forEntity:@"Event" withAttributeID:@"postID"];
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
# warning Using test database on Parse.com: change 'eventParseMapping' to 'eventMapping' for production
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider eventParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kEventPath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
