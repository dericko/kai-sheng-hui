//
//  KSHObjectManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "RKObjectManager.h"

/**
 'KSHObjectManager' Handles initial setup, requests, and responses as application network client. This class should be extended according to request and response behaviour of specific resources.
 @see 'RKObjectManager'
 */
@interface KSHObjectManager : RKObjectManager

@property (nonatomic, strong) RKManagedObjectStore *objectStore;

/**
 Setup client with RestKit using base URL of RESTful API, formatted for JSON Serialization.
 @see http://restkit.org/ for more information
 @param baseURL
 The base URL access point for API
 @return an instance of itself (KSHObjectManager), with calls to request and response methods
 */
+ (instancetype)sharedManager:(NSURL *)baseURL;

/**
 Setup client with RestKit using base URL of RESTful API, formatted for JSON Serialization, and adding personal access token if available.
 @see http://restkit.org/ for more information
 @param baseURL
 The base URL access point for API
 @param personalAccessToken
 The secret user authorization token for API access
 @return an instance of itself (KSHObjectManager), with calls to request and response methods
 */
+ (instancetype)sharedManager:(NSURL *)baseURL withAuthorizationToken:(NSString *)personalAccessToken;

/**
 Tells client how to make API requests
 @see http://restkit.org/ for more information
 */
- (void) setupRequestDescriptors;

/**
 Tells client how to deal with API responses
 @see http://restkit.org/ for more information
 */
- (void) setupResponseDescriptors;

@end
