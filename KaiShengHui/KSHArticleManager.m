//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"

NSString * const kArticlePath = @"/post/rest/gettopposts/";

@implementation KSHArticleManager
// TODO: implement KSHArticleManager methods

- (void)loadArticles:(NSNumber *)numberToLoad success:(void (^)(void))success failure:(void (^)(NSError *error))failure;
{
    /*
     This method automatically checks for Core Data by checking response descriptors 
     for an EntityMapping object and returns an RKManagedObjectRequestOperation if so
     */
#warning check API for correct GET parameters (search, industry, token, etc)
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
    
    // additional request descriptors
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
