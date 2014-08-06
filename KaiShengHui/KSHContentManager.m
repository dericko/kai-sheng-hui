//
//  KSHContentManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/4/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHContentManager.h"
#import "KSHArticle.h"

// Singleton
static KSHContentManager *sharedManager = nil;

@implementation KSHContentManager

# pragma mark - Object manager Setup

+ (instancetype)sharedManager
{
    // singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    
    return sharedManager;
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    [self setPathMatcherForPath:kArticlePath forEntity:@"Article" withAttributeID:@"entityID"];
    [self setPathMatcherForPath:kEventPath forEntity:@"Event" withAttributeID:@"entityID"];
    [self setPathMatcherForPath:kProjectOpportunityPath forEntity:@"ProjectOpportunity" withAttributeID:@"entityID"];
}

- (void)setupResponseDescriptors
{
    RKResponseDescriptor *articleResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleMapping]
                                                                                                method:RKRequestMethodGET
                                                                                           pathPattern:kArticlePath
                                                                                               keyPath:kResponsePrefix
                                                                                           statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *eventResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider eventMapping]
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:kEventPath
                                                                                                  keyPath:kResponsePrefix
                                                                                              statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *projectOpportunityResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider projectOpportunityMapping]
                                                                                                   method:RKRequestMethodGET
                                                                                              pathPattern:kProjectOpportunityPath
                                                                                                  keyPath:kResponsePrefix
                                                                                              statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    
    [self addResponseDescriptor:articleResponseDescriptor];
    [self addResponseDescriptor:eventResponseDescriptor];
    [self addResponseDescriptor:projectOpportunityResponseDescriptor];
}

# pragma mark - Content request methods

- (void)loadArticlesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    [self getObjectsAtPath:kArticlePath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       
                       // Success block
                       if (success) {
                           success();
                       }
                   }
                   failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       if (failure) {
                           failure(error);
                       }
                   }];
}


- (void)loadProjectOpportunitiesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
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

- (void)loadEventsWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
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

@end
