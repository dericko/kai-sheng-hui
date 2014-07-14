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


// FIXME: LoginRequest is no longer a Core Data object, fix this method (use RKMapping, determine appropriate mapping)
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
    // TODO: match this mapping with User API
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
                                                         }];
    userMapping.identificationAttributes = @[ @"userID" ];
    
    
    // TODO: implement like/dislike/follow/comment/etc Functionality (need POST API)
    
    /* Example for adding related objects through JSON mapping
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
//    
//    NSDictionary *attributes = [[myObj entity] attributesByName];
//    for (NSString *attribute in attributes) {
//        id value = [jsonDict objectForKey:attribute];
//        if (value == nil) {
//            continue;
//        }
//        [myObj setValue:value forKey:attribute];
//    }
    
    
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":              @"articleID",
                                                        @"title":           @"title",
                                                        @"tags":         @"excerpt",
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
    
    /* Example for adding related objects through JSON mapping
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
    
    /* Example for adding related objects through JSON mapping
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
