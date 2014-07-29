//
//  KSHHomescreenTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/29/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHHomescreenTableViewController.h"
#import "KSHContentTableViewCell.h"

@interface KSHHomescreenTableViewController ()

@end

@implementation KSHHomescreenTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Add help button
    // TODO: implement help button
    UIBarButtonItem *helpButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"help-icon.png"]  style:UIBarButtonItemStylePlain target:self action:@selector(helpClicked)];
    self.navigationItem.rightBarButtonItem = helpButtonItem;
    
    // Add search bar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20.0, 0.0, 240.0, 20.0)];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;

    // Set up search controller
    // FIXME: Search "bar" should be BUTTON that opens a modal for another page that will actually display search results for an app-wide search
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDelegate = self; // should use tableview's datasource
    searchController.searchResultsDataSource = self; // should use tableview's datasource
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    // Return the height of header for the section.
    switch (section) {
        case 0:
            return 0;
        case 1:
            return 10;
        case 2:
            return 10;
        default:
            // Should not reach this default case!
            return 0;
    }
}

- (void)helpClicked
{
    // TODO: Display help modal
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 3;
        default:
            // Should not reach this default case!
            return 0;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
            [self configureMenuCell:cell atIndexPath:indexPath];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
            [self configureArticleCell:cell atIndexPath: indexPath];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"projectOpportunityCell" forIndexPath:indexPath];
            [self configureProjectOpportunityCell:cell atIndexPath:indexPath];
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 80;
            break;
        default:
            return 100;
            break;
    }
}

# pragma mark - Cell Configuration

- (void)configureMenuCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)configureArticleCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    ((KSHContentTableViewCell *)cell).titleLabel.text = @"test-article";
}

- (void)configureProjectOpportunityCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    ((KSHContentTableViewCell *)cell).titleLabel.text = @"test-proj-opp";
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *nextView = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"viewArticles"]) {

        // Pass any objects that need to be passed
    }
}


@end
