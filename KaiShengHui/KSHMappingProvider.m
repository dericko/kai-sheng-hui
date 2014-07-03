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

+ (RKEntityMapping *) userMapping
{
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    // TODO: finalize user mapping dictionary
    [userMapping addAttributeMappingsFromDictionary:@{
                                                         @"id":              @"userID",
                                                         @"user_name":       @"name",
                                                         @"user_email":      @"email"}];
    userMapping.identificationAttributes = @[ @"userID" ];
    
    return userMapping;
}

+ (RKEntityMapping *) articleMapping
{
    NSLog(@"-articleMapping: assign mapping for article manager");
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":              @"articleID",
                                                        @"title":           @"title",
                                                        @"excerpt":         @"excerpt",
                                                        @"publish_time":    @"datePublished",
                                                        @"content":         @"content",
                                                        @"file.path":       @"imgURL"}];
    articleMapping.identificationAttributes = @[ @"articleID" ];
    
    // TODO: set up image by concatenating:
    // @"file.path" : @"imgURL"
    // @"http://www.i-ksh.com/files/fileUpload/" + @"imgURL"
    return articleMapping;
}

+ (RKEntityMapping *) industryMapping
{
    return PLACEHOLDER;
}

+ (RKEntityMapping *) tagMapping
{
    return PLACEHOLDER;
}

+ (RKEntityMapping *) typeMapping
{
    return PLACEHOLDER;
}

@end
