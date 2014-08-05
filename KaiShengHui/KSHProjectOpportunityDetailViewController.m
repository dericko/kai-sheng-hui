//
//  KSHProjectOpportunityDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectOpportunityDetailViewController.h"
#import "KSHUser.h"

@interface KSHProjectOpportunityDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *deadlineLabel;

@property BOOL isFavorite;
@end
@implementation KSHProjectOpportunityDetailViewController

- (void)viewDidLoad
{
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
    
    // Check if article has been favorited and set star
    _isFavorite = [[KSHUser currentUser].favoritesSet containsObject:_projectOpportunity];
    if (_isFavorite) {
        self.starButton.selected = YES;
    } else {
        self.starButton.selected = NO;
    }
}

# pragma mark - Bottom Bars Buttons

// FIXME: Make these buttons do something real!

- (IBAction)favoritePressed:(id)sender {
    self.starButton.selected = !self.starButton.selected;
    
    if (!_isFavorite) {
        // Add to favorites
        [[KSHUser currentUser].favoritesSet addObject:_projectOpportunity];
        _isFavorite = YES;
    } else {
        // Remove from favorites
        [[KSHUser currentUser].favoritesSet removeObject:_projectOpportunity];
        _isFavorite = NO;
    }
    
    // Save managed object context
    //    NSError *error = nil;
    //    [[KSHUser currentUser].managedObjectContext save:&error];
    //    if (error) {
    //        NSLog([NSString stringWithFormat:@"%@", [error localizedDescription]]);
    //    }
    NSLog([NSString stringWithFormat:@"Like_count: %d", [[KSHUser currentUser].favoritesSet count]]);
    
}
- (IBAction)sharePressed:(id)sender {
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (self.contentLabel.text) {
        [sharingItems addObject:self.contentLabel.text];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

@end