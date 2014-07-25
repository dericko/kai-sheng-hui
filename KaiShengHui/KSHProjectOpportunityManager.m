//
//  KSHProjectOpportunityManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectOpportunityManager.h"

static KSHProjectOpportunityManager *sharedManager = nil;

@implementation KSHProjectOpportunityManager

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
    [self getObjectsAtPath:kProjectOpportunityPath
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
    
    [self setPathMatcherForPath:kProjectOpportunityPath forEntity:@"ProjectOpportunity" withAttributeID:@"opportunityID"];

}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
# warning Using test database on Parse.com: change 'projectOpportunityParseMapping' to 'projectOpportunityMapping' for production
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider projectOpportunityParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kProjectOpportunityPath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
