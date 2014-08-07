//
//  KSHEntityDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityDetailViewController.h"
#import "KSHUser.h"

@interface KSHEntityDetailViewController ()
@property int fontSize;
@end

@implementation KSHEntityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set font size
    _fontSize = 16;
    _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // reveal the navigation header
    [self.navigationController setNavigationBarHidden:NO animated:YES];    
    
    // Update content container to fit Title Content, Article Content, and Bottom Bar Controls
    _containerViewHeightConstraint.constant = _contentLabel.contentSize.height + _titleAreaHeightConstraint.constant + _bottomAreaHeightConstraint.constant;
    
    // Update content size of scroll view
    _scrollView.contentSize = self.containerView.frame.size;
}

- (void)toggleFont
{
    switch (_fontSize) {
        case 16:
            _fontSize = 18;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
        case 18:
            _fontSize = 16;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
        default:
            _fontSize = 18;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
    }
    
    _contentLabel.contentSize = [_contentLabel intrinsicContentSize];
    
    [self viewDidAppear:YES];
}

- (void)share
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (self.contentLabel.text) {
        [sharingItems addObject:self.contentLabel.text];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)favorite
{
    // implement in subclasses
}

- (void)unfavorite
{
    // implement in subclasses
}

@end
