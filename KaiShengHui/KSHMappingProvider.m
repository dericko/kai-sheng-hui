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

+ (NSDictionary *)postMapping
{
    NSDictionary *postMapping = @{
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
    return postMapping;
}

+ (RKEntityMapping *)articleMapping
{
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:[self postMapping]];
    [articleMapping addAttributeMappingsFromDictionary:@{
                                                         @"industry.id":        @"industryID",
                                                         @"tags":               @"tags"
                                                         }];
    articleMapping.identificationAttributes = @[ @"postID" ];
    
    
    //    [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"hasTopic"
    //                                                                                   toKeyPath:@"ofArticle"
    //                                                                                 withMapping:[self topicMapping]]];
    //
    /* Additional JSON mapping support to sync Likes/Dislikes/Favorites
     
     [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"likes"
     toKeyPath:@"likedBy"
     withMapping:[self topicMapping]]];
     
     [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"dislikes"
     toKeyPath:@"dislikedBy"
     withMapping:[self topicMapping]]];
     
     [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"favorites"
     toKeyPath:@"favoritedBy"
     withMapping:[self topicMapping]]];
     */
    
    
    return articleMapping;
}

+ (RKEntityMapping *)eventMapping
{
    NSLog(@"-eventMapping: assign mapping for event manager");
    RKEntityMapping *eventMapping = [RKEntityMapping mappingForEntityForName:@"Event" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [eventMapping addAttributeMappingsFromDictionary:[self postMapping]];
    //    [eventMapping addAttributeMappingsFromDictionary:@{
    // TODO: Fill in JSON properties to be mapped to entity
    //                                                       @"???":              @"chargeType",
    //                                                       @"???":              @"contactEmail",
    //                                                       @"???":              @"contactName",
    //                                                       @"???":              @"contactTelephone",
    //                                                       @"???":              @"endTime",
    //                                                       @"???":              @"eventID",
    //                                                       @"???":              @"eventURLString",
    //                                                       @"???":              @"memberPrice",
    //                                                       @"???":              @"mustApply",
    //                                                       @"???":              @"nonmemberPrice",
    //                                                       @"???":              @"place",
    //                                                       @"???":              @"region",
    //                                                       @"???":              @"startTime",
    //                                                       @"???":              @"type",
    //                                                         }];
    
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

+ (RKEntityMapping *)userMapping
{
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [userMapping addAttributeMappingsFromDictionary:@{
                                                      // TODO: add profile mapping
                                                      }];
    
    return userMapping;
}

+ (RKEntityMapping *)consultantMapping
{
    RKEntityMapping *consultantMapping = [RKEntityMapping mappingForEntityForName:@"Consultant" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [consultantMapping addAttributeMappingsFromDictionary:@{
                                                            // TODO: add profile mapping
                                                            }];
    
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
    [projectMapping addAttributeMappingsFromDictionary:@{
                                                         // TODO: add project mapping
                                                         }];
    
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
