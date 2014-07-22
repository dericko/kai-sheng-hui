//
//  KSHArticleTableViewCell.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/16/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell/SWTableViewCell.h>

@interface KSHArticleTableViewCell : SWTableViewCell <SWTableViewCellDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagsLabel;
@property (strong, nonatomic) IBOutlet UILabel *industryLabel;
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;

@end
