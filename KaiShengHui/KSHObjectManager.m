//
//  KSHObjectManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import "KSHCurrentUser.h"

// !!!: part of test URL
#define BASE_URL @"http://test.i-ksh.net"
#define PERSONAL_ACCESS_TOKEN @"insert_access_token"

static KSHObjectManager *sharedManager = nil;

@implementation KSHObjectManager


+ (instancetype)sharedManager
{
    // singleton
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
        
        // Set up HTTPClient
        [sharedManager setupClientWithURL:url];
    });
    
        return sharedManager;
}

- (void)setupClientWithURL:(NSURL *)url
{
    sharedManager.HTTPClient = [AFHTTPClient clientWithBaseURL:url];
    [sharedManager.HTTPClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setAuthTokenHeader];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tokenChanged:)
                                                 name:@"token-changed"
                                               object:nil];
    
}

- (void)setAuthTokenHeader {
    KSHCurrentUser *currentUser = [[KSHCurrentUser alloc] init];
    NSString *authToken = [currentUser authToken];
    [sharedManager.HTTPClient setDefaultHeader:@"auth_token" value:authToken];
}

- (void)tokenChanged:(NSNotification *)notification {
    [self setAuthTokenHeader];
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
