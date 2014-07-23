//
//  KSHProjectTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectTableViewController.h"
#import "KSHProjectDetailViewController.h"
#import "KSHMessage.h"

@interface KSHProjectTableViewController ()
@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;
@end

@implementation KSHProjectTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    _projectOpportunityManager = [KSHProjectOpportunityManager sharedManager];
    _projectOpportunityManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"ArticleCell";
    self.entityName = @"Article";
    self.sortDescriptorKey = @"publishTime";
    self.segueIdentifier = @"showArticleDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    // TODO: Implement GET Request
}

#pragma mark - Set up Cell

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    _projectOpportunity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // TODO: finish cell configuration
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHProjectDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.projectOpportunity = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}

@end
