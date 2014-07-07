//
//  KSHDislike.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "KSHLikeable.h"

@class KSHArticle, KSHTag, KSHUser;

@interface KSHDislike : KSHLikeable

@property (nonatomic, retain) KSHUser *dislikedBy;
@property (nonatomic, retain) KSHArticle *dislikesArticle;
@property (nonatomic, retain) KSHTag *dislikesTag;

@end
