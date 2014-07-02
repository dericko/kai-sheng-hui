//
//  KSHArticleManager.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleManager.h"

NSString * const kArticlePath = @"/post/rest/gettopposts/15";

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
                                            pathPattern:kArticlePath
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [self addResponseDescriptor:articleResponseDescriptor];
}

@end
