//
//  KSHArticleDetailTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/9/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHArticle.h"

@interface KSHArticleDetailTableViewController : UITableViewController
@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) IBOutlet UILabel *articleTitle;
@property (nonatomic, strong) IBOutlet UITextView *articleContent;
@property (nonatomic, strong) IBOutlet UIImageView *articleImage;
@end
