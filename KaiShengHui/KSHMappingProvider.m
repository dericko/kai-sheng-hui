//
//  KSHMappingProvider.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMappingProvider.h"
#import <RestKit/RestKit.h>


# warning using placeholder object! (set up the other entity mappings)
static RKEntityMapping *PLACEHOLDER = nil;

@implementation KSHMappingProvider

// TODO: implement KSHMappingProvider methods

+ (RKEntityMapping *)loginRequestMapping
{
    RKEntityMapping *loginRequestMapping = [RKEntityMapping mappingForEntityForName:@"Login" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [loginRequestMapping addAttributeMappingsFromDictionary:@{
                                                      @"email":          @"email",
                                                      @"password":       @"password"}];
    
    return loginRequestMapping;
}

+ (RKEntityMapping *)userMapping
{
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [userMapping addAttributeMappingsFromDictionary:@{
                                                      @"id":                @"userID",
                                                      @"username":          @"username",
                                                      @"email":             @"email",
                                                      @"first_name":        @"firstName",
                                                      @"last_name":         @"lastName",
                                                      @"last_login":        @"lastLogin",
                                                      @"sign_up_date":      @"signupDate",
                                                      @"industry.id":       @"industryID",
                                                      @"industry.value":    @"industry"
                                                         // TODO: get user mapping
                                                         }];
    userMapping.identificationAttributes = @[ @"userID" ];
    
    
    /* Wait until db has POST api for like/dislike Articles
     [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"liked"
     toKeyPath:@"likesArticle"
     withMapping:[self likeMapping]]];
     
     [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"disliked"
     toKeyPath:@"dislikesArticle"
     withMapping:[self likeMapping]]];
     */
    
    return userMapping;

}

+ (RKEntityMapping *)articleMapping
{
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":              @"articleID",
                                                        @"title":           @"title",
                                                        @"excerpt":         @"excerpt",
                                                        @"content":         @"content",
                                                        @"editor":          @"author",
                                                        @"publish_time":    @"datePublished",
                                                        @"update_time":     @"dateUpdated",
                                                        @"type":            @"typeID",
                                                        @"view_count":      @"viewCount",
                                                        @"industry.id":     @"industryID",
                                                        @"industry.value":  @"industry",
                                                        @"function.id":     @"functionID",
                                                        @"function.value":  @"function",
                                                        @"file.path":       @"imgURLString"}];
    articleMapping.identificationAttributes = @[ @"articleID" ];
    
    
    [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"hasTags"
                                                                                   toKeyPath:@"ofArticle"
                                                                                 withMapping:[self tagMapping]]];
    
    /* Wait until db has POST api for like/dislike Articles
    [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"liked"
                                                                                   toKeyPath:@"likesArticle"
                                                                                 withMapping:[self likeMapping]]];
    
    [articleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"disliked"
                                                                                   toKeyPath:@"dislikesArticle"
                                                                                 withMapping:[self likeMapping]]];
    */
    
    return articleMapping;
}

+ (RKEntityMapping *)tagMapping
{
    RKEntityMapping *tagMapping = [RKEntityMapping mappingForEntityForName:@"Tag" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [tagMapping addAttributeMappingsFromDictionary:@{
                                                     @"tags":              @"tag"}];
    
    /* Wait until db has POST api for like/dislike Tags
    [tagMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"liked"
                                                                                   toKeyPath:@"likesTag"
                                                                                 withMapping:[self likeMapping]]];
    
    [tagMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"disliked"
                                                                                   toKeyPath:@"dislikesTag"
                                                                                 withMapping:[self likeMapping]]];
     */
    
    return tagMapping;
}

+ (RKEntityMapping *)likeMapping
{
    return PLACEHOLDER;
}

@end
