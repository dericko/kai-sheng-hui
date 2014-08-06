//
//  KSHProjectTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectTableViewController.h"
#import "KSHUserManager.h"

#import "KSHProjectDetailTableViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHSplitButtonView.h"

@interface KSHProjectTableViewController ()
@property (nonatomic, strong) KSHUserManager *userManager;
@property (nonatomic, strong) KSHProject *project;
@property (nonatomic, strong) KSHSplitButtonView *splitButtons;

@end


@implementation KSHProjectTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    // Set up selector buttons
    _splitButtons = [[KSHSplitButtonView alloc] initWithFrame:CGRectMake(0, 10.0, 142.0, 24.0)];
    [_splitButtons addLeftButtonWithTitle:@"Current" forTarget:self withAction:@selector(viewCurrentProjects)];
    [_splitButtons addRightButtonWithTitle:@"Pending" forTarget:self withAction:@selector(viewPendingProjects)];
    self.navigationItem.titleView = _splitButtons;
    
    _userManager = [KSHUserManager sharedManager];
    _userManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"projectCell";
    self.entityName = @"Project";
    self.sortDescriptorKey = @"createDate";
    self.segueIdentifier = @"showProjectDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_userManager) {
        [_userManager loadProjectsForUser:[KSHUser currentUser] success:^{
            // success
            [self.refreshControl endRefreshing];
            if (self.footerView){
                [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
            }
            [self.tableView beginUpdates];
        } failure:^(NSError *error) {
            // Failure
            [self.refreshControl endRefreshing];
            if (self.footerView){
                [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
            }
            [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription] forViewController:self];
        }];
    }
    
}

- (void)viewCurrentProjects
{
    // TODO: implement (add/remove fetch predicate, reload)
}

- (void)viewPendingProjects
{
    // TODO: implement (add/remove fetch predicate, reload)
}


#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    _project = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    
    ((KSHContentTableViewCell *) cell).titleLabel.text = _project.name;
    ((KSHContentTableViewCell *) cell).descriptionLabel.text = _project.projectDescription;
    // Set up tag labels
    ((KSHContentTableViewCell *) cell).detailLabel1.text = [_project getTimeframeName];
    ((KSHContentTableViewCell *) cell).detailLabel2.text = [_project getStatusName];
    ((KSHContentTableViewCell *) cell).detailLabel3.text = [_project getPriorityName];
}



# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
        // send over Project
        KSHProjectDetailTableViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.project = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        destinationViewController.userManager = _userManager;
        destinationViewController.managedObjectContext = self.managedObjectContext;
    }
}

@end
