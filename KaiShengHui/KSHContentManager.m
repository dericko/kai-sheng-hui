//
//  KSHContentManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHContentManager.h"

@implementation KSHContentManager

- (void)loadArticlesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    [self setPathMatcherForPath:kArticlePath forEntity:@"Article" withAttributeID:@"eventID"];
    
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

- (void)loadEventsWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    [self setPathMatcherForPath:kEventPath forEntity:@"Event" withAttributeID:@"eventID"];
    
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

- (void)loadProjectOpportunitiesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure
{
    [self setPathMatcherForPath:kProjectOpportunityPath forEntity:@"ProjectOpportunity" withAttributeID:@"opportunityID"];
    
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

- (void) setPathMatcherForPath:(NSString *)path forEntity:(NSString *)entity withAttributeID:(NSString *)matchID
{
    [self addFetchRequestBlock:^NSFetchRequest *(NSURL *URL) {
        RKPathMatcher *pathMatcher = [RKPathMatcher pathMatcherWithPattern:path];
        
        NSDictionary *argsDict = nil;
        BOOL match = [pathMatcher matchesPath:[URL relativePath] tokenizeQueryStrings:NO parsedArguments:&argsDict];
        NSString *contentID;
        if (match) {
            contentID = [argsDict objectForKey:@"id"];
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entity];
            fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%@ = %@", matchID, @([contentID integerValue])]; // NOTE: Coerced from string to number
            fetchRequest.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"publishTime" ascending:NO] ];
            return fetchRequest;
        }
        
        return nil;
    }];
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
# warning Using test database on Parse.com: change 'articleParseMapping' to 'articleMapping' for production
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kArticlePath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *eventResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider eventParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kEventPath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *projectOpportunityResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider projectOpportunityParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kProjectOpportunityPath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
    [self addResponseDescriptor:eventResponseDescriptor];
    [self addResponseDescriptor:projectOpportunityResponseDescriptor];
}

@end