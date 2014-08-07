//
//  KSHContentTableViewCell.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell/SWTableViewCell.h>
#import "KSHColorPicker.h"

@interface KSHContentTableViewCell : SWTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel1;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel2;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel3;

@end
