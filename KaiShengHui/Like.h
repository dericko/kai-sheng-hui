//
//  Like.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "KSHLikeDislike.h"

@class KSHArticle, KSHTag, KSHUser;

@interface Like : KSHLikeDislike

@property (nonatomic, retain) KSHUser *user;
@property (nonatomic, retain) KSHArticle *article;
@property (nonatomic, retain) KSHTag *tag;

@end
