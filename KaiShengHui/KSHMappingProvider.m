//
//  KSHMappingProvider.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMappingProvider.h"
#import <RestKit/RestKit.h>


// !!!: Placeholder object for compilation, remove after implementing all methods
static RKEntityMapping *PLACEHOLDER = nil;

@implementation KSHMappingProvider

# pragma mark - Content Mapping

+ (RKEntityMapping *)topicMapping
{
    return PLACEHOLDER;
}

+ (NSDictionary *)postMap
{
    NSDictionary *postMap = @{
                                  @"content":           @"content",
                                  @"creator":           @"creator",
                                  @"editor":            @"editor",
                                  @"excerpt":           @"excerpt",
                                  //                                  @"???":               @"fileType",
                                  //                                  @"???":               @"guestContent",
                                  //                                  @"???":               @"homePage",
                                  @"file.path":         @"imgURLString",
                                  @"id":                @"postID",
                                  //                                  @"???":               @"postType",
                                  @"publish_time":      @"publishTime",
                                  @"title":             @"title",
                                  @"update_time":       @"updateTime",
                                  @"view_count":        @"viewCount",
                                  };
    return postMap;
}

+ (RKEntityMapping *)articleMapping
{
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *articleMap = @{
                                 @"industry.id":        @"industryID",
                                 @"tags":               @"tags"
                                 };
    [articleMapping addAttributeMappingsFromDictionary:[self postMap]];
    [articleMapping addAttributeMappingsFromDictionary: articleMap];
//    [articleMapping addRelationshipMappingWithSourceKeyPath:@"hasTopic" mapping:[self topicMapping]];
    
    articleMapping.identificationAttributes = @[ @"postID" ];
    
    /* Additional JSON mapping support to sync Likes/Dislikes/Favorites
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"likedBy" mapping:[self userMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"dislikedBy" mapping:[self userMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"favoritedBy" mapping:[self userMapping]];
     */
    
    
    return articleMapping;
}

+ (RKEntityMapping *)eventMapping
{
    NSLog(@"-eventMapping: assign mapping for event manager");
    RKEntityMapping *eventMapping = [RKEntityMapping mappingForEntityForName:@"Event" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *eventMap = @{
                               //     TODO: Fill in JSON properties to be mapped to entity
                               @"???":              @"chargeType",
                               @"???":              @"contactEmail",
                               @"???":              @"contactName",
                               @"???":              @"contactTelephone",
                               @"???":              @"endTime",
                               @"???":              @"eventID",
                               @"???":              @"eventURLString",
                               @"???":              @"memberPrice",
                               @"???":              @"mustApply",
                               @"???":              @"nonmemberPrice",
                               @"???":              @"place",
                               @"???":              @"region",
                               @"???":              @"startTime",
                               @"???":              @"type",
                               };
    [eventMapping addAttributeMappingsFromDictionary:[self postMap]];
    [eventMapping addAttributeMappingsFromDictionary:eventMap];
    eventMapping.identificationAttributes = @[ @"postID" ];
    return eventMapping;
}

# pragma mark - User Mapping

+ (RKEntityMapping *)profileMapping
{
    RKEntityMapping *profileMapping = [RKEntityMapping mappingForEntityForName:@"Profile" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [profileMapping addAttributeMappingsFromDictionary:@{
                                                         // TODO: add profile mapping
                                                         }];
    
    return profileMapping;
}

+ (NSDictionary *)userMap
{
    NSDictionary *userMap = @{
                              
                              };
    return userMap;
}
+ (RKEntityMapping *)userMapping
{
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    [userMapping addAttributeMappingsFromDictionary:[self userMap]];
    userMapping.identificationAttributes = @[ @"userID" ];

    /* Additional JSON mapping support to sync Likes/Dislikes/Favorites
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"likes" mapping:[self topicMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"dislikes" mapping:[self topicMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"favorites" mapping:[self topicMapping]];
     */
    return userMapping;
}

+ (RKEntityMapping *)consultantMapping
{
    RKEntityMapping *consultantMapping = [RKEntityMapping mappingForEntityForName:@"Consultant" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *consultantMap = @{
                                    // TODO: add profile mapping
                                    };
    [consultantMapping addAttributeMappingsFromDictionary:[self userMap]];
    [consultantMapping addAttributeMappingsFromDictionary:consultantMap];
    consultantMapping.identificationAttributes = @[ @"userID" ];
    ;
    
    return consultantMapping;
}

# pragma mark - Project Mapping

+ (RKEntityMapping *)taskMapping
{
    return PLACEHOLDER;
}

+ (RKEntityMapping *)feedbackMapping
{
    return PLACEHOLDER;
}

+ (RKEntityMapping *)projectMapping
{
    RKEntityMapping *projectMapping = [RKEntityMapping mappingForEntityForName:@"Project" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *projectMap = @{
                                 // TODO: add project mapping
                                 };
    [projectMapping addAttributeMappingsFromDictionary:projectMap];
    
    [projectMapping addRelationshipMappingWithSourceKeyPath:@"tasks" mapping:[self topicMapping]];
    
    return projectMapping;
}

+ (RKEntityMapping *)projectOpportunityMapping
{
    RKEntityMapping *projectOpportunityMapping = [RKEntityMapping mappingForEntityForName:@"ProjectOpportunity" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [projectOpportunityMapping addAttributeMappingsFromDictionary:@{
                                                                    // TODO: add project opportunity mapping
                                                                    }];
    
    return projectOpportunityMapping;
}

@end
