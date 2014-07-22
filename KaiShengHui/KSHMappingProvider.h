//
//  KSHMappingProvider.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSHObjectManager.h"
@class RKEntityMapping;

/**
 'KSHMappingProvider' Uses RestKit object mapping to define custom mapping between data objects and JSON-formatted network response information
 
 Attribute Mapping Dictionary Format: {@"JSONKey" : @"CoreDataPropertyName"}
 Note: Keep track of (orphaned) objects by setting identificationAttributes:
 (e.g. userMapping.identificationAttributes = @[ @"userID" ];)
 
 
 Dependencies: RestKit 0.20.0
 @see 'RKObjectMapping'
 */
@interface KSHMappingProvider : NSObject

// TODO: comment mapping methods
// TODO: comment mapping methods
+ (RKEntityMapping *)articleMapping;
+ (RKEntityMapping *)eventMapping;

+ (RKEntityMapping *)userMapping;
+ (RKEntityMapping *)consultantMapping;

+ (RKEntityMapping *)projectMapping;
+ (RKEntityMapping *)projectOpportunityMapping;

@end
