//
//  KSHProjectTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectTableViewController.h"
#import "KSHContentManager.h"

#import "KSHProjectDetailViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHSplitButtonView.h"

@interface KSHProjectTableViewController ()
@property (nonatomic, strong) KSHContentManager *contentManager;
@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;
@property (nonatomic, strong) KSHSplitButtonView *splitButtons;

@end

@implementation KSHProjectTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    // Set up selector buttons
    _splitButtons = [[KSHSplitButtonView alloc] initWithFrame:CGRectMake(0, 10.0, 142.0, 24.0)];
    [_splitButtons addLeftButtonWithTitle:@"Newest" forTarget:self withAction:@selector(viewNewest)];
    [_splitButtons addRightButtonWithTitle:@"Popular" forTarget:self withAction:@selector(viewPopular)];
    self.navigationItem.titleView = _splitButtons;
    
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
    self.entityName = @"ProjectOpportunity";
    self.sortDescriptorKey = @"createDate";
    self.segueIdentifier = @"showProjectOpportunityDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_contentManager) {
        [_contentManager
         loadProjectOpportunitiesWithParameters:nil
         success:^(void) {
             [self.refreshControl endRefreshing];
             if (self.footerView){
                 [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
             }
             [self.tableView beginUpdates];
         } failure:^(NSError *error) {
             [self.refreshControl endRefreshing];
             if (self.footerView){
                 [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
             }
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
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
    
    _projectOpportunity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    
    ((KSHContentTableViewCell *) cell).titleLabel.text = [[_projectOpportunity valueForKey:@"title"] description];
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_projectOpportunity valueForKey:@"referenceContent"] description];
    ((KSHContentTableViewCell *) cell).detailLabel3.text = [[_projectOpportunity valueForKey:@"deadlineDate"] description];
}



# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];

    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHProjectDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.projectOpportunity = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}

@end
