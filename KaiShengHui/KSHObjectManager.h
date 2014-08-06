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

# warning Using Parse API constants - must replace with real API when it's ready

// !!!:  API Path Constants
#define kBASE_URL @"https://api.parse.com"
#define kAPI_KEY @"insert_access_token"
#define kArticlePath @"/1/classes/Article"
#define kEventPath @"/1/classes/Event"
#define kLoginPath @"/1/login"
#define kUserPath @"/1/users/me"
#define kProfilePath @"/1/classes/Profile"
#define kProjectPath @"/1/classes/Project"
#define kTaskPath @"/1/classes/Task"
#define kProjectOpportunityPath @"/1/classes/ProjectOpportunity"

// Request queries specific to Parse's REST API, need to retrieve user data (change or delete when real API is ready)
// @see https://www.parse.com/docs/rest#queries-relational
#define kResponsePrefix @"results"
#define kProfileParamsHead @"{\"$relatedTo\":{\"object\":{\"__type\":\"Pointer\",\"className\":\"_User\",\"objectId\":\""
#define kProfileParamsTail @"\"},\"key\":\"profile\"}}"
#define kProjectParamsHead @"{\"$relatedTo\":{\"object\":{\"__type\":\"Pointer\",\"className\":\"_User\",\"objectId\":\""
#define kProjectParamsTail @"\"},\"key\":\"hasProject\"}}"
#define kTaskParamsHead @"{\"$relatedTo\":{\"object\":{\"__type\":\"Pointer\",\"className\":\"Project\",\"objectId\":\""
#define kTaskParamsTail @"\"},\"key\":\"hasTask\"}}"

// !!!: API Key Constants
// For information on Parse Queries see: https://www.parse.com/docs/rest#queries
#define kAppHeader @"X-Parse-Application-Id"
#define kAppKey @"d3RYCmBykmK7gIpg3kvrAqX2MaGvuYQBnepJJH4S"
#define kRESTAPIHeader @"X-Parse-REST-API-Key"
#define kRestAPIKey @"EfYIGGw8KDiQLebS2TB6dtIqc6JtJ4SSJvGZKIwO"
#define kSessionTokenHeader @"X-Parse-Session-Token"

/**
 'KSHObjectManager' Is a network client that handles initial setup, request descriptors, and response mapping. This class can be subclassed according to request and response behaviour of specific resources.
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
 Tells client how to make API requests, to be used with POST, PUT, PATH HTTP methods.
 Specific to each subclass of object manager.
 @see http://restkit.org/ for more information
 */
- (void)setupRequestDescriptors;

/**
 Tells client how to deal with API responses, such as how to map a JSON response to your objects.
 Specific to each subclass of object manager.
 @see http://restkit.org/ for more information
 */
- (void)setupResponseDescriptors;

/**
 Sets up path matching for requests, so that locally mapped entities will stay up to date with database objects. For example, if a database object is deleted, this path matcher will tell Core Data to remove the corresponding object from the local persistent store.
 @param path
 The URL string path to match for, not including the base URL
 @param entity
 The Core Data entity to perform mapping for
 @param matchID
 The attribute ID checked for against to confirm matches, usually in the form 'id' or 'entityNameID'
 */
- (void)setPathMatcherForPath:(NSString *)path forEntity:(NSString *)entity withAttributeID:(NSString *)matchID;

@end

@protocol KSHObjectManagerDelegate <NSObject>

@optional
- (void)loadUser;

@end