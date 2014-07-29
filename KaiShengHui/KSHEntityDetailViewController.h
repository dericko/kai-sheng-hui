//
//  KSHEntityDetailViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A content view controller with a ScrollArea (TitleArea + ContentArea) and BottomBarArea. Uses height constraints to dynamically resize the window according to content length on each load. This serves as the parent view controller for entity detail views with dynamic content.
 */
@interface KSHEntityDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *containerViewHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleAreaHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomAreaHeightConstraint;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UITextView *contentLabel;

@property (strong, nonatomic) IBOutlet UIButton *starButton;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;

@end