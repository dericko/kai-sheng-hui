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
    _eventManager = [KSHEventManager sharedManager];
    _eventManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"ContentCell";
    self.entityName = @"Event";
    self.sortDescriptorKey = @"publishDate";
    self.segueIdentifier = @"showEventDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_eventManager) {
        [_eventManager
         loadContentWithParameters:nil
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
    ((KSHContentTableViewCell *) cell).detailLabel1.text = [[_event valueForKey:@"region"] description];
    ((KSHContentTableViewCell *) cell).detailLabel2.text = [NSString stringWithFormat:@"%@", [[_event valueForKey:@"startDate"] description]];
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_event valueForKey:@"excerpt"] description];
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHEventDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.event = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}

@end
