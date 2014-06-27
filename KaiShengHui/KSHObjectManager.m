//
//  KSHObjectManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import <RestKit/RestKit.h>

#define BASE_URL @"insert_base_url"
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
        
        // set MIMEType to JSON
        sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
        // Set up request and response behavior
        [sharedManager setupRequestDescriptors];
        [sharedManager setupResponseDescriptors];
        
        // Add token
        [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"token %@", PERSONAL_ACCESS_TOKEN]];
    });
    
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
