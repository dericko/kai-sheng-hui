//
//  KSHContentManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"

/** Content Manager base class for GET requests that will be mapped to a Core Data entity
 */
@interface KSHContentManager : KSHObjectManager <KSHObjectManagerDelegate>

@property (nonatomic, strong) NSString *objectPath;

- (void)loadArticlesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

- (void)loadEventsWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

- (void)loadProjectOpportunitiesWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

@end