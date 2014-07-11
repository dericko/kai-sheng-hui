//
//  KSHArticleManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import "KSHArticle.h"

extern NSString * const kArticlePath;

/**
 'KSHArticleManager' Defines articleObject-specific request and response behavior. It handles interactions with an object mapping provider to map network responses to an article model.
 @see 'KSHObjectManager'
 */
@interface KSHArticleManager : KSHObjectManager

- (void)loadArticles:(NSNumber *)numberToLoad success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

@end
