//
//  KSHFavoriteTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHFavoriteTableViewController.h"
#import "KSHSplitButtonView.h"
#import "KSHArticle.h"
#import "KSHProjectOpportunity.h"
#import "KSHContentTableViewCell.h"
#import "KSHArticleDetailViewController.h"
#import "KSHProjectOpportunityDetailViewController.h"
#import "KSHUser.h"

@interface KSHFavoriteTableViewController ()

@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;
@property (nonatomic, strong) KSHSplitButtonView *splitButtons;

@property BOOL viewArticleMode;
@property (nonatomic, strong) NSSet *allFavorites;
@property (nonatomic, strong) NSPredicate *viewArticles;
@property (nonatomic, strong) NSPredicate *viewProjectOpportunities;
@property (nonatomic, strong) NSMutableOrderedSet *currentItems;

@end

@implementation KSHFavoriteTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup selector buttons
    _splitButtons = [[KSHSplitButtonView alloc] initWithFrame:CGRectMake(0, 10.0, 142.0, 24.0)];
    [_splitButtons addLeftButtonWithTitle:@"Articles" forTarget:self withAction:@selector(displayArticles)];
    [_splitButtons addRightButtonWithTitle:@"Projects" forTarget:self withAction:@selector(displayProjectOpportunities)];
    self.navigationItem.titleView = _splitButtons;
    
    // Setup predicates
    _viewArticles = [NSPredicate predicateWithFormat:@"fetchableType == 1"];
    _viewProjectOpportunities = [NSPredicate predicateWithFormat:@"fetchableType == 3"];
    
    // Get current user's favorites
    _allFavorites = [KSHUser currentUser].favoritesSet;
    NSLog([NSString stringWithFormat:@"All Favorites...%d", [_allFavorites count]]);
    [self displayArticles];
}

- (void)viewDidAppear:(BOOL)animated
{
    _allFavorites = [KSHUser currentUser].favoritesSet;
    NSLog([NSString stringWithFormat:@"All Favorites...%d", [_allFavorites count]]);

    [self displayArticles];
}

- (void)displayArticles
{
    _viewArticleMode = YES;
    _currentItems = [NSMutableOrderedSet orderedSetWithSet:[_allFavorites filteredSetUsingPredicate:_viewArticles]];
    NSLog([NSString stringWithFormat:@"Favorite Articles...%d", [_currentItems count]]);
    [self.tableView reloadData];
}

- (void)displayProjectOpportunities
{
    _viewArticleMode = NO;
    _currentItems = [NSMutableOrderedSet orderedSetWithSet:[_allFavorites filteredSetUsingPredicate:_viewProjectOpportunities]];
    NSLog([NSString stringWithFormat:@"Favorite Projects...%d", [_currentItems count]]);
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Only one section in this table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_currentItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    if (_viewArticleMode) {
        cellIdentifier = @"ArticleCell";
    } else {
        cellIdentifier = @"ProjectOpportunityCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
    if (_viewArticleMode) {
        
        // Set up the current article cell
        _article = [_currentItems objectAtIndex:indexPath.row];
        ((KSHContentTableViewCell *)cell).titleLabel.text = [[_article valueForKey:@"title"] description];
        ((KSHContentTableViewCell *)cell).detailLabel1.text = @"www.iksh.com";
        if (!_article.industryName) [_article setIndustryText];
        ((KSHContentTableViewCell *)cell).detailLabel2.text = [[_article valueForKey:@"industryName"] description];;
        ((KSHContentTableViewCell *)cell).detailLabel3.text = [[_article valueForKey:@"tags"] description];
        
        UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:100];
        articleImageView.image = [_article getImage];
        
    } else {
        
        // Set up the current project opportunity cell
        _projectOpportunity = [_currentItems objectAtIndex:indexPath.row];
        
        ((KSHContentTableViewCell *) cell).titleLabel.text = [[_projectOpportunity valueForKey:@"title"] description];
        ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_projectOpportunity valueForKey:@"referenceContent"] description];
        ((KSHContentTableViewCell *) cell).detailLabel3.text = [[_projectOpportunity valueForKey:@"deadlineDate"] description];
    }
    
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showArticle"]) {
        
        // Pass on the Article object
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHArticleDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.article = [_currentItems objectAtIndex:indexPath.row];
        
    } else if ([segue.identifier isEqualToString:@"showProjectOpportunity"]) {
        
        // Pass on the Project Opportunity object
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHProjectOpportunityDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.projectOpportunity = [_currentItems objectAtIndex:indexPath.row];
    }
}

@end
