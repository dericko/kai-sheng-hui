//
//  KSHHomescreenTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/29/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHHomescreenTableViewController.h"
#import "KSHContentTableViewCell.h"
#import "KSHContentManager.h"
#import "KSHArticleDetailViewController.h"
#import "KSHProjectOpportunityDetailViewController.h"

@interface KSHHomescreenTableViewController ()

@property (nonatomic, strong) KSHContentManager *contentManager;
@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;

@property int numberToLoad;

@end

@implementation KSHHomescreenTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup networking managers
    _contentManager = [KSHContentManager sharedManager];
    
    // Setup core data stack
    _contentManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;

    // setup toolbar
    [self setupToolbar];
    
    // Set up request
    self.numberToLoad = 3;
    
    // setup refresh control
    [self addRefreshControl];
    [self.refreshControl beginRefreshing];
    
    // GET content
    [self getData];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showLoginScreenIfNeccessary];
}

# pragma mark - Initialization helpers

- (void)addRefreshControl
{
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)setupToolbar
{
    UIBarButtonItem *helpButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"help-icon.png"]  style:UIBarButtonItemStylePlain target:self action:@selector(helpClicked)];
    self.navigationItem.rightBarButtonItem = helpButtonItem;
    
    // Add search bar
    // TODO: determine whether or not to keep Search Bar + Delegates in this screen
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20.0, 0.0, 240.0, 20.0)];
    //    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    // Set up search controller
    // FIXME: Search "bar" should be BUTTON that opens a modal for another page that will actually display search results for an app-wide search
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    //    searchController.delegate = self;
    searchController.searchResultsDelegate = self; // should use tableview's datasource
    searchController.searchResultsDataSource = self; // should use tableview's datasource
}

- (void)getData
{
#warning Uses 'parameters' that are specific to Parse REST API used in testing. May need to change with real API
    NSString *numberToLoad = [NSString stringWithFormat:@"%d", self.numberToLoad];
    NSDictionary *parameters = @{@"limit": numberToLoad};
    
    if (_contentManager) {
        // Load articles
        [self controllerWillChangeContent:_fetchedResults1];
        [_contentManager
         loadArticlesWithParameters:parameters
         success:^(void) {
             [self.refreshControl endRefreshing];
             [self controllerDidChangeContent:_fetchedResults1];
         } failure:^(NSError *error) {
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
         }];
        
        // Load project opportunities
        [self controllerWillChangeContent:_fetchedResults2];
        [_contentManager
         loadProjectOpportunitiesWithParameters:parameters
         success:^{
             [self.refreshControl endRefreshing];
             [self controllerDidChangeContent:_fetchedResults2];
         } failure:^(NSError *error) {
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
         }];
    }
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (void)helpClicked
{
    // TODO: Display help modal
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Should equal three (2 fetched results sections + 1 top section for menu)
    return [[self.fetchedResults1 sections] count] + [[self.fetchedResults2 sections] count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        // Shift fetched results controller by one (should be 0)
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResults1 sections] objectAtIndex:section - 1];
        // Cap the number of rows at the predined limit of "numberToLoad"
        return ([sectionInfo numberOfObjects] > self.numberToLoad) ? self.numberToLoad : [sectionInfo numberOfObjects];
        
    } else if (section == 2) {
        // Shift fetched results controller by two (should be 0)
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResults2 sections] objectAtIndex:section - 2];
        // Cap the number of rows at the predined limit of "numberToLoad"
        return ([sectionInfo numberOfObjects] > self.numberToLoad) ? self.numberToLoad : [sectionInfo numberOfObjects];
    }
    
    NSLog(@"Failed to set up number of rows for section %d", section);
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"projectOpportunityCell" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 80;
        default:
            return 70;
    }
}

# pragma mark - Cell Configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1];
        _article = [self.fetchedResults1 objectAtIndexPath:indexPath1];
        ((KSHContentTableViewCell *) cell).titleLabel.text = [[_article valueForKey:@"title"] description];
        ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_article valueForKey:@"excerpt"] description];
        
        // Set image
        UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:100];
        UIImage *placeholderImage = [UIImage imageNamed:@"ksh-default.jpg"];
        UIImageView *placeholderImageView = [[UIImageView alloc] initWithImage:placeholderImage];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[_article valueForKey:@"imgURLString"] description]]]];
        
        [placeholderImageView
         setImageWithURLRequest:request
         placeholderImage:placeholderImage
         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
             articleImageView.image = image;
         } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
             [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error  localizedDescription]];
             NSLog(@"Error: %@", error);
         }];

    } else if (indexPath.section == 2) {
        NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        _projectOpportunity = [self.fetchedResults2 objectAtIndexPath:indexPath2];
        ((KSHContentTableViewCell *) cell).titleLabel.text = [[_projectOpportunity valueForKey:@"title"] description];
        ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_projectOpportunity valueForKey:@"referenceContent"] description];
    }
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResults1
{
    if (_fetchedResults1 != nil) {
        return _fetchedResults1;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Assign Core Data entity for fetchedResultsController
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Article" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Assign sort descriptor (one of entity's properties)

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"entityID" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Assign section key path and cache
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResults1 = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResults1 performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResults1;
}

- (NSFetchedResultsController *)fetchedResults2
{
    if (_fetchedResults2 != nil) {
        return _fetchedResults2;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Assign Core Data entity for fetchedResultsController
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ProjectOpportunity" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Assign sort descriptor (one of entity's properties)
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"entityID" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Assign section key path and cache
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResults2 = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResults2 performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResults2;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    if (controller == _fetchedResults1) {
        sectionIndex += 1;
    } else if (controller == _fetchedResults2) {
        sectionIndex += 2;
    }
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    NSIndexPath *adjustedIndexPath = nil;
    NSIndexPath *adjustedNewIndexPath = nil;
    
    if (controller == _fetchedResults1) {
        adjustedIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section + 1];
        adjustedNewIndexPath = [NSIndexPath indexPathForRow:newIndexPath.row inSection:newIndexPath.section + 1];
    } else if (controller == _fetchedResults2) {
        adjustedIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section + 2];
        adjustedNewIndexPath = [NSIndexPath indexPathForRow:newIndexPath.row inSection:newIndexPath.section + 2];
    }
    
    if (adjustedIndexPath && adjustedNewIndexPath) {
        switch(type) {
            case NSFetchedResultsChangeInsert:
                [tableView insertRowsAtIndexPaths:@[adjustedNewIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeDelete:
                [tableView deleteRowsAtIndexPaths:@[adjustedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case NSFetchedResultsChangeUpdate:
                [self configureCell:[tableView cellForRowAtIndexPath:adjustedIndexPath] atIndexPath:adjustedIndexPath];
                break;
                
            case NSFetchedResultsChangeMove:
                [tableView deleteRowsAtIndexPaths:@[adjustedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                [tableView insertRowsAtIndexPaths:@[adjustedNewIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
        }
    } else {
        NSLog(@"Did not update NSFetchedResults change. Check NSFetchedResultsControllerDelegate methods");
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        NSString *segueIdentifier = @"showArticleDetail";
        [self performSegueWithIdentifier:segueIdentifier sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    } else if (indexPath.section == 2) {
        NSString *segueIdentifier = @"showProjectOpportunityDetail";
        [self performSegueWithIdentifier:segueIdentifier sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"showArticleDetail"]) {
         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.tableView indexPathForSelectedRow].row inSection:[self.tableView indexPathForSelectedRow].section - 1];
        KSHArticleDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.article = [[self fetchedResults1] objectAtIndexPath:indexPath];
    }
    
    else if ([segue.identifier isEqualToString:@"showProjectOpportunityDetail"]) {
         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.tableView indexPathForSelectedRow].row inSection:[self.tableView indexPathForSelectedRow].section - 2];
        KSHProjectOpportunityDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.projectOpportunity = [[self fetchedResults2] objectAtIndexPath:indexPath];
        
    }
    
    [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
}

# pragma mark - Login check

- (void)showLoginScreenIfNeccessary
{
    if (![[KSHUserManager sharedManager] isLoggedIn]) {
		// Register for login succeeded notification
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin) name:UserDidLoginNotification object:nil];
		
		KSHLoginViewController* loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
        [self presentViewController:loginViewController animated:YES completion:NULL];
        
		loginViewController.delegate = self;
	}
}

- (void)userDidLogin
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loginViewControllerDidCancel:(KSHLoginViewController *)loginViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end