//
//  KSHContentManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 8/4/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"

/**
 'Defines content request and response behavior for Articles, Project Opportunities, and Events. Can be extended to handle further requests. Methods should handle interactions with an object mapping provider to map network responses to corresponding models.
 
 Note: The internal RestKit automatically checks for Core Data by checking response descriptors for an EntityMapping object (from KSHMappingProvider) and returns an RKManagedObjectRequestOperation if so. This means that the all RKObjectManager subclasses (such as this class) can work with Core Data NSManagedObjects or regular NSObjects.
 Be sure to implement similar behaviour if switching away from Restkit.
 
 @see 'KSHObjectManager'
 */
@interface KSHContentManager : KSHObjectManager

//+ (instancetype)sharedManager;

/** Wrapper for a RestKit network request.
 Loads Article JSON from API and executes provided success: and failure: blocks.
 */
- (void)loadArticlesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

/** Wrapper for a RestKit network request.
 Loads ProjectOpportunity JSON from API and executes provided success: and failure: blocks.
 */
- (void)loadProjectOpportunitiesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

/** Wrapper for a RestKit network request.
 Loads Event JSON from API and executes provided success: and failure: blocks.
 */
- (void)loadEventsWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

@end
