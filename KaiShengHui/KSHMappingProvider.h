//
//  KSHMappingProvider.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSHObjectManager.h"
@class RKObjectMapping;

/**
 'KSHMappingProvider' Uses RestKit object mapping to define custom mapping between data objects and JSON-formatted network response information
 @see 'RKObjectMapping'
 */
@interface KSHMappingProvider : NSObject

// TODO: comment mapping methods
+ (RKObjectMapping *) userMapping;
+ (RKObjectMapping *) articleMapping;
+ (RKObjectMapping *) industryMapping;
+ (RKObjectMapping *) tagMapping;
+ (RKObjectMapping *) typeMapping;

@end
