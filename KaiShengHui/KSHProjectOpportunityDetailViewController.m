//
//  KSHProjectOpportunityDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectOpportunityDetailViewController.h"
#import "KSHUser.h"
#import "KSHDetailToolbarView.h"

@interface KSHProjectOpportunityDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *deadlineLabel;

@property BOOL isFavorite;
@property (strong, nonatomic) KSHDetailToolbarView *toolbarView;

@end
@implementation KSHProjectOpportunityDetailViewController

- (void)viewDidLoad
{
    // Setup toolbar
    _toolbarView = [[KSHDetailToolbarView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [_toolbarView addResizeButtonForTarget:self action:@selector(toggleFont)];
    [_toolbarView addShareButtonForTarget:self action:@selector(share)];
    [_toolbarView addFavoriteButtonForTarget:self favorite:@selector(toggleFavorite)];
    UIBarButtonItem *toolbar = [[UIBarButtonItem alloc] initWithCustomView:_toolbarView];
    [self.navigationItem setRightBarButtonItem:toolbar];
    
    // Set content fields
    NSString *title = [NSString stringWithFormat:@"%@", _projectOpportunity.title];
    NSString *content = [NSString stringWithFormat:@"理想背景: \n %@ \n\n 关键问题: %@", _projectOpportunity.idealBackground, _projectOpportunity.referenceContent];
    NSString *publishDate = [NSString stringWithFormat:@"发布时间: %@", _projectOpportunity.createDate];
    NSString *deadline = [NSString stringWithFormat:@"截止日期: %@", _projectOpportunity.deadlineDate];
    // Assign content fields
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    self.publishDateLabel.text = publishDate;
    self.deadlineLabel.text = deadline;
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Check if project opportunity has been favorited and set star
    _isFavorite = [[KSHUser currentUser].favoritesSet containsObject:_projectOpportunity];
    if (_isFavorite) {
        _toolbarView.favoriteButton.selected = YES;
    } else {
        _toolbarView.favoriteButton.selected = NO;
    }
}

# pragma mark - Bottom Bars Buttons

// FIXME: Make these buttons do something real!

- (void)toggleFavorite
{
    if (!_isFavorite) {
        // Add to favorites
        [[KSHUser currentUser].favoritesSet addObject:_projectOpportunity];
        _isFavorite = YES;
    } else {
        // Remove from favorites
        [[KSHUser currentUser].favoritesSet removeObject:_projectOpportunity];
        _isFavorite = NO;
    }
    
    NSLog([NSString stringWithFormat:@"Like_count: %d", [[KSHUser currentUser].favoritesSet count]]);
    
}

@end