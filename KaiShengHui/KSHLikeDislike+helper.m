//
//  KSHLikeDislike+helper.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLikeDislike+helper.h"

@implementation KSHLikeDislike (helper)

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    [self setCreatedAt:[NSDate date]];
}

- (void)didTurnIntoFault
{
    [super didTurnIntoFault];
    [self setDeletedAt:[NSDate date]];
}

@end
