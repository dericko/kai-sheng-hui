//
//  KSHMappingProvider.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMappingProvider.h"
#import <RestKit/RestKit.h>


# warning placeholder object
static RKEntityMapping *PLACEHOLDER = nil;

@implementation KSHMappingProvider

// TODO: implement KSHMappingProvider methods

+ (RKEntityMapping *) userMapping
{
    return PLACEHOLDER;
}

+ (RKEntityMapping *) articleMapping
{

    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":              @"articleID",
                                                        @"title":           @"title",
                                                        @"excerpt":         @"excerpt",
                                                        @"publish_time":    @"datePublished",
                                                        @"content":         @"content"}];
    articleMapping.identificationAttributes = @[ @"articleID" ];
    
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
