//
//  KSHEntityDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityDetailViewController.h"
#import "KSHDetailToolbarView.h"

@interface KSHEntityDetailViewController ()
@property int fontSize;
@end

@implementation KSHEntityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Font Button
    _fontSize = 16;
    _contentLabel.font = [UIFont systemFontOfSize:_fontSize];
    KSHDetailToolbarView *toolbarView = [[KSHDetailToolbarView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [toolbarView addResizeButtonForTarget:self action:@selector(adjustFont)];
    [toolbarView addShareButtonForTarget:self action:@selector(share)];
    // FIXME: should change target to [KSHUser currentUser] and link to favorite/unfavorite methods
    [toolbarView addFavoriteButtonForTarget:self favorite:@selector(favorite) unfavorite:@selector(unfavorite)];

    UIBarButtonItem *toolbar = [[UIBarButtonItem alloc] initWithCustomView:toolbarView];
    [self.navigationItem setRightBarButtonItem:toolbar];
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
    
}

- (void)unfavorite
{
    
}

@end
