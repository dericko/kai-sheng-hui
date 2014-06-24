//
//  KSHObjectManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import <RestKit/RestKit.h>

@implementation KSHObjectManager

+ (instancetype)sharedManager:(NSURL *)baseURL
{
    // instantiate object manager
    KSHObjectManager *sharedManager = [self managerWithBaseURL:baseURL];
    // define MIMEType as JSON
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    // Set up request and response behavior
    [sharedManager setupRequestDescriptors];
    [sharedManager setupResponseDescriptors];
    
    return sharedManager;
}

+ (instancetype)sharedManager:(NSURL *)baseURL withAuthorizationToken:(NSString *)personalAccessToken
{
    KSHObjectManager *sharedManager = [self sharedManager:baseURL];
    
    // set access token
    [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"token %@", personalAccessToken]];
    
    return sharedManager;
}

- (void)setupRequestDescriptors
{
  // any general code for requests
}

- (void)setupResponseDescriptors
{
  // any general code for responses
}

@end
