//
//  KSHDislike+helper.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHDislike+helper.h"

@implementation KSHDislike (helper)

- (void)dislikeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article
{
    self.flag = @NO;
    self.user = user;
    self.article = article;
}

- (void)dislikeWithUser:(KSHUser *)user forTag:(KSHTag *)tag
{
    self.flag = @NO;
    self.user = user;
    self.tag = tag;
}

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    self.flag = @NO;
}

@end
