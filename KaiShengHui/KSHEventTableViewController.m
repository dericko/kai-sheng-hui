//
//  KSHEventTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventTableViewController.h"
#import "KSHEventDetailViewController.h"
#import "KSHMessage.h"

@interface KSHEventTableViewController ()
@property (nonatomic, strong) KSHEvent *event;
@end

@implementation KSHEventTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    _eventManager = [KSHEventManager sharedManager];
    _eventManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"INSERT_CELL_IDENTIFIER";
    self.entityName = @"Event";
    self.sortDescriptorKey = @"publishTime";
    self.segueIdentifier = @"INSERT_SEGUE_ID";
    
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
    
    _event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // TODO: finish cell configuration
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHEventDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.event = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}

@end
