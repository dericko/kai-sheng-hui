//
//  KSHMappingProvider.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMappingProvider.h"
#import <RestKit/RestKit.h>


# warning Must update mapping for REAL API once it is released.

@implementation KSHMappingProvider

# pragma mark - Content Mapping

+ (RKEntityMapping *)articleMapping
{
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    NSDictionary *postMap = @{
                              @"objectId":          @"entityID",
                              @"content":           @"content",
                              @"creator":           @"creator",
                              @"editor":            @"editor",
                              @"excerpt":           @"excerpt",
                              @"publish_time":      @"createDate",
                              @"title":             @"title",
                              @"type":              @"type",
                              @"update_time":       @"updateDate",
                              @"view_count":        @"viewCount",
                              };
    
    
    NSDictionary *articleMap = @{
                                 @"file.path":          @"imgURLString",
                                 @"function.value":     @"function",
                                 @"home":               @"homePage",
                                 @"origin.id":          @"source",
                                 @"origin.value":       @"sourceName",
                                 @"industry.id":        @"industry",
                                 @"tags":               @"tags"
                                 };
    [articleMapping addAttributeMappingsFromDictionary:postMap];
    [articleMapping addAttributeMappingsFromDictionary: articleMap];
//    [articleMapping addRelationshipMappingWithSourceKeyPath:@"hasTopic" mapping:[self topicMapping]];
    
    articleMapping.identificationAttributes = @[ @"entityID" ];
    
    /* Additional JSON mapping support to sync Likes/Dislikes/Favorites
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"likedBy" mapping:[self userMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"dislikedBy" mapping:[self userMapping]];
     [articleMapping addRelationshipMappingWithSourceKeyPath:@"favoritedBy" mapping:[self userMapping]];
     */
    
    
    return articleMapping;
}

+ (RKEntityMapping *)eventMapping
{
    RKEntityMapping *eventMapping = [RKEntityMapping mappingForEntityForName:@"Event" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    NSDictionary *postMap = @{
                              @"objectId":              @"entityID",
                              @"post_type":             @"postType",
                              @"publish_time":          @"createDate",
                              @"update_time":           @"updateDate",
                              @"view_count":            @"viewCount",
                              @"creator":               @"creator",
                              @"editor":                @"editor",
                              @"post.title":            @"title",
                              @"post.content":          @"content",
                              @"post.excerpt":          @"excerpt",
                              @"post.guest_content":    @"guestContent"
                              };
    
    NSDictionary *eventMap = @{
                                 @"event_fields.apply.must_apply":      @"mustApply",
                                 @"event_fields.apply.charge_type":     @"chargeType",
                                 @"event_fields.apply.member_price":    @"memberPrice",
                                 @"event_fields.apply.nonmember_price": @"nonmemberPrice",
                                 @"event_fields.contact.contact_name":  @"contactName",
                                 @"event_fields.contact.contact_email": @"contactEmail",
                                 @"event_fields.region":                @"region",
                                 @"event_fields.place":                 @"place",
                                 @"event_fields.startTime":             @"startDate",
                                 @"event_fields.endTime":               @"endDate",
                                 @"event_fields.type":                  @"type",
                                 @"url":                                @"urlString"
                                 };
    [eventMapping addAttributeMappingsFromDictionary:postMap];
    [eventMapping addAttributeMappingsFromDictionary: eventMap];
    eventMapping.identificationAttributes = @[ @"entityID" ];
    ;
    
    return eventMapping;
}

#pragma mark - User Mapping

+ (RKEntityMapping *)userMapping
{
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *userMap = @{
                              @"objectId":          @"userID",
                              @"createdAt":         @"createDate",
                              @"email":             @"email",
                              @"sessionToken":      @"token",
                              @"username":          @"username",
                              @"updatedAt":         @"updateDate"
                              };
    [userMapping addAttributeMappingsFromDictionary: userMap];
    userMapping.identificationAttributes = @[ @"userID" ];
    
    return userMapping;
}


+ (RKEntityMapping *)profileMapping
{
    RKEntityMapping *profileMapping = [RKEntityMapping mappingForEntityForName:@"Profile" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *profileMap = @{
                                 @"birthday":      @"birthday",
                                 @"company":       @"company",
                                 @"createdAt":     @"createDate",
                                 @"education":     @"education",
                                 @"first_name":    @"firstName",
                                 @"gender":        @"gender",
                                 @"industry":      @"industry",
                                 @"last_name":     @"lastName",
                                 @"mobile":        @"mobile",
                                 @"name":          @"name",
                                 @"nickname":      @"nickname",
                                 @"objectId":      @"entityID",
                                 @"position":      @"position",
                                 @"profile":       @"profile",
                                 @"residence":     @"residence",
                                 @"specialty":     @"specialty",
                                 @"updatedAt":     @"updateDate"
                                 };
    [profileMapping addAttributeMappingsFromDictionary: profileMap];
    profileMapping.identificationAttributes = @[ @"entityID" ];
    
    
    return profileMapping;
}

# pragma mark - Profile Mapping

+ (RKEntityMapping *)projectMapping
{
    RKEntityMapping *projectMapping = [RKEntityMapping mappingForEntityForName:@"Project" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *projectMap = @{
                                            @"objectId":            @"entityID",
                                            @"category":            @"category",
                                            @"currency_unit":       @"currencyUnit",
                                            @"end_time.iso":        @"endDate",
                                            @"industry":            @"industry",
                                            @"name":                @"name",
                                            @"price":               @"price",
                                            @"priority":            @"priority",
                                            @"project_description": @"projectDescription",
                                            @"start_time.iso":      @"startDate",
                                            @"status":              @"status",
                                            @"status_time":         @"statusTime",
                                            @"type":                @"type",
                                            @"createdAt":           @"createDate",
                                            @"updatedAt":           @"updateDate"
                                            };
    [projectMapping addAttributeMappingsFromDictionary: projectMap];
    projectMapping.identificationAttributes = @[ @"entityID" ];
    ;
        
    return projectMapping;
}

+ (RKEntityMapping *)taskMapping
{
    RKEntityMapping *taskMapping = [RKEntityMapping mappingForEntityForName:@"Task" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *taskMap = @{
                              @"objectId":            @"entityID",
                              @"end_time.iso":        @"endDate",
                              @"name":                @"name",
                              @"notes":               @"notes",
                              @"paid":                @"paid",
                              @"start_time.iso":      @"startDate",
                              @"status":              @"status",
                              @"timezone":            @"timezone",
                              @"createdAt":           @"createDate",
                              @"updatedAt":           @"updateDate"
                              };
    [taskMapping addAttributeMappingsFromDictionary: taskMap];
    taskMapping.identificationAttributes = @[ @"entityID" ];
    ;
    
    return taskMapping;
}

+ (RKEntityMapping *)projectOpportunityMapping
{
    RKEntityMapping *projectOpportunityMapping = [RKEntityMapping mappingForEntityForName:@"ProjectOpportunity" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    NSDictionary *projectOpportunityMap = @{
                               @"objectId":                     @"entityID",
                               @"content.title":                @"title",
                               @"content.ideal_background":     @"idealBackground",
                               @"content.reference_content":    @"referenceContent",
                               @"content.contacts":             @"contacts",
                               @"content.deadline_time":        @"deadlineDate",
                               @"publish_time":                 @"createDate",
                               @"url":                          @"urlString"
                               };
    [projectOpportunityMapping addAttributeMappingsFromDictionary: projectOpportunityMap];
    projectOpportunityMapping.identificationAttributes = @[ @"entityID" ];
    ;
    
    return projectOpportunityMapping;
}

@end
