//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"

// !!!: part of test URL
NSString * const kArticlePath = @"/post/rest/gettopposts/";

@implementation KSHArticleManager
// TODO: implement KSHArticleManager methods


- (void)loadArticles:(NSNumber *)numberToLoad success:(void (^)(void))success failure:(void (^)(NSError *error))failure;
{
// FIXME
    NSDictionary *parameters = @{@"articleCount": numberToLoad};
    
    [self getObjectsAtPath:kArticlePath
                parameters:parameters
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       if (success) {
                           success();
                       }}
                   failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       if (failure) {
                           failure(error);
                       }
                   }];
}

- (void)setupRequestDescriptors
{
    [super setupRequestDescriptors];
    
    [self addFetchRequestBlock:^NSFetchRequest *(NSURL *URL) {
        RKPathMatcher *pathMatcher = [RKPathMatcher pathMatcherWithPattern:kArticlePath];
        
        NSDictionary *argsDict = nil;
        BOOL match = [pathMatcher matchesPath:[URL relativePath] tokenizeQueryStrings:NO parsedArguments:&argsDict];
        NSString *articleID;
        if (match) {
            articleID = [argsDict objectForKey:@"id"];
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Article"];
            fetchRequest.predicate = [NSPredicate predicateWithFormat:@"articleID = %@", @([articleID integerValue])]; // NOTE: Coerced from string to number
            fetchRequest.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"publish_time" ascending:YES] ];
            return fetchRequest;
        }
        
        return nil;
    }];


}

- (void)setupResponseDescriptors
{
    [super setupResponseDescriptors];
    
    // add additional response descriptors
    RKResponseDescriptor *articleResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[KSHMappingProvider articleMapping]
                                                 method:RKRequestMethodGET
                                            pathPattern:kArticlePath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
