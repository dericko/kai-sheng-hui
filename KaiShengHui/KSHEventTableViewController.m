//
//  KSHEventTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventTableViewController.h"
#import "KSHEventDetailViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHMessage.h"

@interface KSHEventTableViewController ()
@property (nonatomic, strong) KSHEvent *event;
@end

@implementation KSHEventTableViewController

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
    self.entityName = @"Event";
    self.sortDescriptorKey = @"publishTime";
    self.segueIdentifier = @"";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (self.contentManager) {
        [self.contentManager
         loadEventsWithParameters:nil
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
    
    _event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard

    ((KSHContentTableViewCell *) cell).titleLabel.text = [[_event valueForKey:@"title"] description];
    ((KSHContentTableViewCell *) cell).detailLabel1.text = [[_event valueForKey:@"excerpt"] description];
    ((KSHContentTableViewCell *) cell).detailLabel2.text = [[_event valueForKey:@"memberPrice"] description];
    ((KSHContentTableViewCell *) cell).dateLabel.text = [[_event valueForKey:@"publishTime"] description];
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_event valueForKey:@"excerpt"] description];
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
