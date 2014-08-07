//
//  KSHEventTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventTableViewController.h"
#import "KSHContentManager.h"

#import "KSHEventDetailViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHSplitButtonView.h"

@interface KSHEventTableViewController ()
@property (nonatomic, strong) KSHEvent *event;
@property (nonatomic, strong) KSHContentManager *contentManager;

@property (nonatomic, strong) KSHSplitButtonView *splitButtons;

@end

@implementation KSHEventTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    // Set up selector buttons
    _splitButtons = [[KSHSplitButtonView alloc] initWithFrame:CGRectMake(0, 10.0, 142.0, 24.0)];
    [_splitButtons addLeftButtonWithTitle:@"Newest" forTarget:self withAction:@selector(viewNewest)];
    [_splitButtons addRightButtonWithTitle:@"Popular" forTarget:self withAction:@selector(viewPopular)];
    self.navigationItem.titleView = _splitButtons;
    
    // Setup networking/core data
    _contentManager = [KSHContentManager sharedManager];
    _contentManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @10;
    self.cellIdentifier = @"ContentCell";
    self.entityName = @"Event";
    self.sortDescriptorKey = @"createDate";
    self.segueIdentifier = @"showEventDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_contentManager) {
        [_contentManager
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
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription] forViewController:self];
         }];
    }
}

- (void)viewNewest
{
    // TODO: implement (add/remove fetch predicate, reload)
}

- (void)viewPopular
{
    // TODO: implement (add/remove fetch predicate, reload)
}


#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    _event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard

    ((KSHContentTableViewCell *) cell).titleLabel.text = [[_event valueForKey:@"title"] description];
    ((KSHContentTableViewCell *) cell).detailLabel1.text = _event.region;
    [((KSHContentTableViewCell *)cell).detailLabel1 setBackgroundColor:[KSHColorPicker colorForLocation:_event.region]];
    ((KSHContentTableViewCell *) cell).detailLabel2.text = [NSString stringWithFormat:@"%@", _event.startDate];
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = _event.excerpt;
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
