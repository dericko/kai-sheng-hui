//
//  KSHProjectTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectTableViewController.h"
#import "KSHProjectDetailViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHMessage.h"

@interface KSHProjectTableViewController ()
@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;
@end

@implementation KSHProjectTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    self.contentManager = [KSHContentManager sharedManager];
    self.contentManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"ContentCell";
    self.entityName = @"ProjectOpportunity";
    self.sortDescriptorKey = @"publishTime";
    self.segueIdentifier = @"";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (self.contentManager) {
        [self.contentManager
         loadProjectOpportunitiesWithParameters:nil
         success:^(void) {
             [self.refreshControl endRefreshing];
             if (self.footerView){
                 [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
             }
         } failure:^(NSError *error) {
             [self.refreshControl endRefreshing];
             if (self.footerView){
                 [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
             }
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
         }];
    }
}

#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    _projectOpportunity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    
    ((KSHContentTableViewCell *) cell).titleLabel.text = [[_projectOpportunity valueForKey:@"title"] description];
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_projectOpportunity valueForKey:@"referenceContent"] description];
    ((KSHContentTableViewCell *) cell).dateLabel.text = [[_projectOpportunity valueForKey:@"publishTime"] description];
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
