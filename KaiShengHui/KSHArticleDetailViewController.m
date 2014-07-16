//
//  KSHArticleDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/10/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleDetailViewController.h"

@interface KSHArticleDetailViewController ()

@end

@implementation KSHArticleDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set content fields
    _articleTitle.text = _article.title;
    _articleContent.text = _article.content;
    // TODO: set up filter for html '&xxxx' tags
    _articleIndustry.text = _article.industry;
    _articleTags.text = [NSString stringWithFormat:@"Tags: %@", _article.tags];
    _articleImage.image = [_article getImage];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    // Update content container to fit Title Content, Article Content, and Bottom Bar Controls
    _heightConstraint.constant = _articleContent.contentSize.height + _titleAreaHeightConstraint.constant + _bottomAreaHeightConstraint.constant;
    
    // Update content size of scroll view
    _scrollView.contentSize = self.containerView.frame.size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Bottom Bar Buttons
// TODO: implement interaction buttons - Like, Unlike, Star, Share

@end
