//
//  KSHObjectManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "RKObjectManager.h"
#import "KSHMappingProvider.h"

/**
 'KSHObjectManager' Handles initial setup, requests, and responses as application network client. This class should be extended according to request and response behaviour of specific resources.
 Dependencies: RestKit 0.20.0
 @see 'RKObjectManager'
 */
@interface KSHObjectManager : RKObjectManager

/**
 Setup client with RestKit using base URL of RESTful API, formatted for JSON Serialization.
 @see http://restkit.org/ for more information
 @param baseURL
 The base URL access point for API
 @return an instance of itself (KSHObjectManager), with calls to request and response methods
 */
+ (instancetype)sharedManager;

/**
 Tells client how to make API requests
 @see http://restkit.org/ for more information
 */
- (void)setupRequestDescriptors;

/**
 Tells client how to deal with API responses
 @see http://restkit.org/ for more information
 */
- (void)setupResponseDescriptors;

@end
