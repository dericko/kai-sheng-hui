//
//  KSHEntityDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityDetailViewController.h"

@interface KSHEntityDetailViewController ()
@property int fontSize;
@end

@implementation KSHEntityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Font Button
    _fontSize = 19;
    _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
    UIBarButtonItem *fontSizeButton = [[UIBarButtonItem alloc] initWithTitle:@"Aa" style:UIBarButtonItemStylePlain target:self action:@selector(adjustFont)];
    [self.navigationItem setRightBarButtonItem:fontSizeButton];
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

- (void)adjustFont
{
    switch (_fontSize) {
        case 17:
            _fontSize = 19;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
        case 19:
            _fontSize = 17;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
        default:
            _fontSize = 19;
            _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
            break;
    }
    
    _contentLabel.contentSize = [_contentLabel intrinsicContentSize];
    
    [self viewDidAppear:YES];
}

@end
