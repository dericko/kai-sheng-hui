//
//  KSHObjectManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"

// !!!: part of test URL
#define BASE_URL @"http://test.i-ksh.net"
#define PERSONAL_ACCESS_TOKEN @"insert_access_token"

static KSHObjectManager *sharedManager = nil;

@implementation KSHObjectManager


+ (instancetype)sharedManager
{
    // singleton pattern
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // instantiate object manager with base url
        NSURL *url = [NSURL URLWithString:BASE_URL];
        sharedManager = [self managerWithBaseURL:url];
        
        // Serialize for JSON
        sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
        // Set up request and response behavior
        [sharedManager setupRequestDescriptors];
        [sharedManager setupResponseDescriptors];
        
        // TODO: Add token to request (after JSON API is implemented)
//        [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"token %@", PERSONAL_ACCESS_TOKEN]];
    });
    
        return sharedManager;
}

- (void)setupRequestDescriptors
{
  // any common code for requests
}

- (void)setupResponseDescriptors
{
  // any common code for responses
}

@end
