//
//  KSHArticleTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticle.h"
#import "KSHTag.h"
#import "KSHArticleTableViewController.h"
#import "KSHArticleDetailViewController.h"
#import "KSHMessage.h"

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "SWRevealViewController.h"

@interface KSHArticleTableViewController ()
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;

@property (nonatomic, strong) KSHArticle *article;
@end

@implementation KSHArticleTableViewController

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
    
    // Article manager instance
    NSLog(@"instantiate article manager...");
    _articleManager = [KSHArticleManager sharedManager];
    NSLog(@"instantiate article manager...DONE");
    _articleManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    // set managed object context to main queue
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    // Configure sidebar reveal button    
    [self.revealButtonItem setTarget: self.revealViewController];
    [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];

    // finish initialization
    [self addRefreshControl];
    [self loadArticles];
    [self.refreshControl beginRefreshing];
    
}

# pragma mark - Initialization helpers

- (void)addRefreshControl
{
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(loadArticles) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)loadArticles
{
# warning consider using managedObjectRequestOperation to integrate Core Data persistence
    if (_articleManager) {
        [_articleManager loadArticles:^(void) {
            [self.refreshControl endRefreshing];
        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
            [self.refreshControl endRefreshing];
            [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
             }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ArticleCell";
    SWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                                cellIdentifier forIndexPath:indexPath];
    
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"-"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                title:@"+"];
    
    return rightUtilityButtons;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // Assign cell labels
    _article = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UILabel *articleTitleLabel = (UILabel *)[cell viewWithTag:100];
    articleTitleLabel.text = [[_article valueForKey:@"title"] description];
    
    UILabel *articleExcerptLabel = (UILabel *)[cell viewWithTag:101];
    articleExcerptLabel.text = [[_article valueForKey:@"excerpt"] description];;

    UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:102];

    // Async request and assign cell image
    if (!_article.imgFile) {
        [self setImageAsync: articleImageView atIndexPath:indexPath];
    } else {
        articleImageView.image = [[self.fetchedResultsController objectAtIndexPath:indexPath] getImage];
    }
}

- (void)setImageAsync:(UIImageView *)articleImageView atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"grabbing image...");
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder-square.jpg"];
    UIImageView *placeholderImageView = [UIImageView new];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[_article valueForKey:@"imgURLString"] description]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [placeholderImageView
     setImageWithURLRequest:request
     placeholderImage:placeholderImage
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        NSLog(@"grabbing image...DONE");
        articleImageView.image = image;
        [[self.fetchedResultsController objectAtIndexPath:indexPath] setImage:image];
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error  localizedDescription]];
        NSLog(@"Error: %@", error);
     }];
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showArticleDetail" sender:[self.tableView cellForRowAtIndexPath:indexPath]];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showArticleDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHArticleDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.article = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        destinationViewController.articleImage = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription *article = [NSEntityDescription entityForName:@"Article" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:article];
    
    // TODO: Set the batch size to a suitable number (currently 15)
#warning batch size does not determine number of cells returned
    [fetchRequest setFetchBatchSize:15];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"datePublished" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:self.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
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
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
        {
            // TODO: implement downvote
            [KSHMessage displayMessageAlert:@"Downvote" withSubtitle:@"We'll show you fewer articles like this"];
            
            [cell hideUtilityButtonsAnimated:YES];
            
            break;
        }
        case 1:
        {
            // TODO: implement upvote
            [KSHMessage displayMessageAlert:@"Upvote" withSubtitle:@"We'll show you more articles like this"];
            
            [cell hideUtilityButtonsAnimated:YES];
            
            break;
        }
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

@end
