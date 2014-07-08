//
//  KSHDislike+helper.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHDislike.h"

@interface KSHDislike (helper)

- (void)dislikeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article;
- (void)dislikeWithUser:(KSHUser *)user forTag:(KSHTag *)tag;

@end
