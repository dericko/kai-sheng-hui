//
//  KSHObjectManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"

static KSHObjectManager *sharedManager = nil;

@implementation KSHObjectManager


+ (instancetype)sharedManager
{
    // instantiate object manager with base url
    NSURL *url = [NSURL URLWithString:kBASE_URL];
    sharedManager = [self managerWithBaseURL:url];

    // Serialize for JSON
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;

    // Setup request and response behavior
    [sharedManager setupRequestDescriptors];
    [sharedManager setupResponseDescriptors];

    // Setup API key headers
    [sharedManager setupAPIHeaders];
    
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

# pragma mark - Initialization helpers

- (void)setPathMatcherForPath:(NSString *)path forEntity:(NSString *)entity withAttributeID:(NSString *)matchID
{
    [self addFetchRequestBlock:^NSFetchRequest *(NSURL *URL) {
        RKPathMatcher *pathMatcher = [RKPathMatcher pathMatcherWithPattern:path];
        
        NSDictionary *argsDict = nil;
        BOOL match = [pathMatcher matchesPath:[URL relativePath] tokenizeQueryStrings:NO parsedArguments:&argsDict];
        NSString *contentID;
        if (match) {
            contentID = [argsDict objectForKey:@"id"];
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entity];
            fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%@ = %@", matchID, @([contentID integerValue])]; // NOTE: Coerced from string to number
            fetchRequest.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"publishDate" ascending:NO] ];
            return fetchRequest;
        }
        
        return nil;
    }];
}

- (void)setupAPIHeaders
{
    [sharedManager.HTTPClient setDefaultHeader:kAppHeader value:kAppKey];
    [sharedManager.HTTPClient setDefaultHeader:kRESTAPIHeader value:kRestAPIKey];
}

@end
