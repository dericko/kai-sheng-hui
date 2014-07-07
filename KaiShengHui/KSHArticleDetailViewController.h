//
//  KSHArticleDetailViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHArticle.h"
#import "KSHArticle+helper.h"

@interface KSHArticleDetailViewController : UIViewController
@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) IBOutlet UILabel *articleTitle;
@property (nonatomic, strong) IBOutlet UITextView *articleContent;
@property (nonatomic, strong) IBOutlet UIImageView *articleImage;
@end
