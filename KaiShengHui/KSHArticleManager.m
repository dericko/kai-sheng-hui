//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"



@interface KSHArticleManager()
@end

@implementation KSHArticleManager

- (void)setPath
{
    self.objectPath = kArticlePath;
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    [self setPath];
    
    // Check objects by comparing existing postIDs with incoming calls and delete orphaned objects
    [self addFetchRequestBlock:^NSFetchRequest *(NSURL *URL) {
        RKPathMatcher *pathMatcher = [RKPathMatcher pathMatcherWithPattern:kArticlePath];
        
        NSDictionary *argsDict = nil;
        BOOL match = [pathMatcher matchesPath:[URL relativePath] tokenizeQueryStrings:NO parsedArguments:&argsDict];
        NSString *contentID;
        if (match) {
            contentID = [argsDict objectForKey:@"id"];
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Article"];
            fetchRequest.predicate = [NSPredicate predicateWithFormat:@"postID = %@", @([contentID integerValue])]; // NOTE: Coerced from string to number
            fetchRequest.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"publishTime" ascending:NO] ];
            return fetchRequest;
        }
        
        return nil;
    }];
}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
# warning Using test database on Parse.com: change 'articleParseMapping' to 'articleMapping' for production
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleParseMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:self.objectPath
                                                keyPath:@"results"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
