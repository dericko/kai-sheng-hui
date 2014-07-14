//
//  KSHArticleDetailViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/10/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHArticle.h"

@interface KSHArticleDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleAreaHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomAreaHeightConstraint;

@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) IBOutlet UILabel *articleTitle;
@property (nonatomic, strong) IBOutlet UITextView *articleContent;
@property (nonatomic, strong) IBOutlet UIImageView *articleImage;
@end
