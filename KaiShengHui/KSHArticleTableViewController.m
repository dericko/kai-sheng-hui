//
//  KSHArticleTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleTableViewController.h"

#import <RestKit/RestKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "KSHArticle.h"
#import "KSHMessage.h"

#import "KSHArticleTableViewCell.h"
#import "KSHArticleDetailViewController.h"

@interface KSHArticleTableViewController ()
@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) UIView * footerView;
@end


@implementation KSHArticleTableViewController
{
    NSArray *industryMenuItems;
    NSNumber *numberToLoad;
}

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
    
    // Collection View setup
    industryMenuItems = @[@"Retail", @"TMT", @"Ag+Food", @"Energy", @"Chemicals", @"Finance", @"Healthcare", @"Transport"];
    
    // Core Data setup
    _articleManager = [KSHArticleManager sharedManager];
    _articleManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    // set up refresh control
    [self addRefreshControl];
    [self initFooterView];
    [self.refreshControl beginRefreshing];
    
    // load articles
    // FIXME: only load articles if they do not already exist (past articles are already saved in SQLite db by Core Data)
    numberToLoad = @15;
    [self loadArticles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"loading Articles");
    if (_articleManager) {
        [_articleManager loadArticles:numberToLoad
                              success:^(void) {
                                  [self.refreshControl endRefreshing];
                                  if (_footerView){
                                      [(UIActivityIndicatorView *)[_footerView viewWithTag:10] stopAnimating];
                                  }
                              }
                              failure:^(NSError *error) {
                                  [self.refreshControl endRefreshing];
                                  if (_footerView){
                                      [(UIActivityIndicatorView *)[_footerView viewWithTag:10] stopAnimating];
                                  }
                                  [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription]];
                              }];
    }
}

#pragma mark - Table view cells

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // FIXME: Limit initial load size (currently returns everything in fetchedResultsController)
    
    // Return the number of rows in the section.
    /* NOTE: FetchedResultsController will wait until ([sectionInfo numberOfObjects] > 0)
     (Waits for async network request to add items to managedObjectContext) and then 
     load cells with tableView:cellForRowAtIndexPath (below).
     */
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    numberToLoad = [NSNumber numberWithInteger:[sectionInfo numberOfObjects]];
    return numberToLoad.integerValue;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ArticleCell";
    
    KSHArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                                cellIdentifier forIndexPath:indexPath];
    cell.rightUtilityButtons = [self rightButtons];

    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table View Cell helpers

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([[_fetchedResultsController fetchedObjects] count] > 0) {
        _article = [self.fetchedResultsController objectAtIndexPath:indexPath];
    } else {
        @throw [NSException exceptionWithName:@"fetchFromEmptyFetchedResultsControllerException:"
                                       reason:@"Trying to fetch objects from empty fetchedResultsController (will result in arrayOutOfBounds) Check that return value from tableView:numberOfRowsInSection is based on number of objects in fetchedResultsController"
                                     userInfo:nil];
    }

    /* Keep cell type UITableViewCell in declaration to satisfy the implementation of
     controller:didChangeObject:atIndexPath:forChangeType:newIndexPath: (part of
     fetched results controller)
     Can typecast below because we know it is a KSHArticleTableViewCell
     */
    ((KSHArticleTableViewCell *)cell).titleLabel.text = [[_article valueForKey:@"title"] description];
    ((KSHArticleTableViewCell *)cell).tagsLabel.text = [[_article valueForKey:@"tags"] description];
    if (!_article.industry) {
        NSLog(@"Setting industry");
        [_article setIndustryText];
    }
    ((KSHArticleTableViewCell *)cell).industryLabel.text = [[_article valueForKey:@"industry"] description];;

    UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:100];
    // Check if image has been downloaded
    if (!_article.imgFile) {
        [self setImageAsync: articleImageView atIndexPath:indexPath];
    } else {
        articleImageView.image = [[self.fetchedResultsController objectAtIndexPath:indexPath] getImage];
    }
}

- (void)setImageAsync:(UIImageView *)articleImageView atIndexPath:(NSIndexPath *)indexPath
{
    // Async request and assign cell image
    // FIXME: Displays most recent image instead of Placeholder while loading
    UIImage *placeholderImage = [UIImage imageNamed:@"ksh-default.jpg"];
    UIImageView *placeholderImageView = [UIImageView new];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[_article valueForKey:@"imgURLString"] description]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Use UIImageView+AFNetworking to make request and save image
    [placeholderImageView
     setImageWithURLRequest:request
     placeholderImage:placeholderImage
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        articleImageView.image = image;
        [[self.fetchedResultsController objectAtIndexPath:indexPath] setImage:image];
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error  localizedDescription]];
        NSLog(@"Error: %@", error);
     }];
}

- (NSArray *)rightButtons
{
    // Set utility buttons for SWTableViewCell
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"-"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                title:@"+"];
    
    return rightUtilityButtons;
}

-(void)initFooterView
{
    _footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 40.0)];
    
    UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.tag = 10;
    
    activityIndicator.frame = CGRectMake(150.0, 5.0, 20.0, 20.0);
    
    activityIndicator.hidesWhenStopped = YES;
    
    [_footerView addSubview:activityIndicator];
    
    activityIndicator = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView
                  willDecelerate:(BOOL)decelerate{
    
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    float reload_distance = 50;
    
    // Check if already refreshing articles
    BOOL isRefreshing = [(UIActivityIndicatorView *)[_footerView viewWithTag:10] isAnimating];
    
    if((y > h + reload_distance) && (!isRefreshing)) {
        NSLog(@"load more rows");
        
        self.tableView.tableFooterView = _footerView;
            
        [(UIActivityIndicatorView *)[_footerView viewWithTag:10] startAnimating];
        
        numberToLoad = [NSNumber numberWithInt:(numberToLoad.intValue + 10)];
        NSLog(@"more articles! %@", numberToLoad);
        
        [self loadArticles];
        [self.tableView reloadData];
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
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"publishTime" ascending:NO];
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
    }
}

#pragma mark - CollectionViewDataSource/Delegate

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [industryMenuItems count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

// FIXME: does not create cells, should allow for more types of cells (e.g. most recent, favorites, industry trends)
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"IndustryCell" forIndexPath:indexPath];
    
    // TODO: Setup CollectionViewCell
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: implement Select Item behaviour (click)
}


@end
