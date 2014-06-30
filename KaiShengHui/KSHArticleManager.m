//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"

NSString * const _Article_Path = @"/gists/public"; //edited for testing with github gist api

@implementation KSHArticleManager
// TODO: implement KSHArticleManager methods

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
                                                         pathPattern:@"/gists/public"
                                                         keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
