//
//  KSHArticleTableViewCell.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/16/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleTableViewCell.h"

@implementation KSHArticleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
        {
            // TODO: implement Dislike
            [KSHMessage displayMessageAlert:@"Dislike" withSubtitle:@"We'll show you fewer articles like this"];
            
            [cell hideUtilityButtonsAnimated:YES];
            
            break;
        }
        case 1:
        {
            // TODO: implement Like
            [KSHMessage displayMessageAlert:@"Like" withSubtitle:@"We'll show you more articles like this"];
            
            [cell hideUtilityButtonsAnimated:YES];
            
            break;
        }
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}


@end
