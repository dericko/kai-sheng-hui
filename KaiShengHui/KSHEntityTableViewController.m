//
//  KSHEntityTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityTableViewController.h"

@interface KSHEntityTableViewController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@end

@implementation KSHEntityTableViewController
{
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
    
    NSAssert(self.managedObjectContext, @"No managedObjectContext: make sure you set up Core Data and networking");
    
    // Set up selector buttons
    // TODO: refactor with a nice custom button subclasses
    CGRect frame1 = CGRectMake(1, 1.0, 70.0, 22.0);
    _button1= [[UIButton alloc] initWithFrame:frame1];
    _button1.titleLabel.font = [UIFont systemFontOfSize:14];
    [_button1 setTitle:@"Newest" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_button1 addTarget:self action:@selector(button1Clicked) forControlEvents:UIControlEventTouchUpInside];
    [_button1 setBackgroundColor:[UIColor darkGrayColor]];
    [_button1 setSelected:YES];
    
    CGRect frame2 = CGRectMake(71.0, 1.0, 70.0, 22.0);
    _button2 = [[UIButton alloc] initWithFrame:frame2];
    _button2.titleLabel.font = [UIFont systemFontOfSize:14];
    [_button2 setTitle:@"Popular" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_button2 addTarget:self action:@selector(button2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [_button2 setBackgroundColor:[UIColor whiteColor]];
    [_button2 setSelected:NO];
    
    CGRect typeSelectFrame = CGRectMake(0, 10.0, 142.0, 24.0);
    UIView *typeSelectButtonsView = [[UIView alloc] initWithFrame:typeSelectFrame];
    typeSelectButtonsView.backgroundColor = [UIColor blackColor];
    [typeSelectButtonsView addSubview:_button1];
    [typeSelectButtonsView addSubview:_button2];
    
    self.navigationItem.titleView = typeSelectButtonsView;
    
    // Setup filter menu
    UIBarButtonItem *filterButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(filterClicked)];
    self.navigationItem.rightBarButtonItem = filterButtonItem;
    
    // set up refresh control
    [self addRefreshControl];
    [self initFooterView];
    [self.refreshControl beginRefreshing];

    // set up cell
    [self assignCustomClassFields];
    [self loadCells];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)button1Clicked
{
    if (!_button1.selected) {
        [_button1 setSelected:YES];
        [_button1 setBackgroundColor:[UIColor darkGrayColor]];
        [_button2 setSelected:NO];
        [_button2 setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)button2Clicked
{
    if (!_button2.selected) {
        [_button2 setSelected:YES];
        [_button2 setBackgroundColor:[UIColor darkGrayColor]];
        [_button1 setSelected:NO];
        [_button1 setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)filterClicked
{
    // TODO: modal with scroll view with Industries, etc.
}
                                         
# pragma mark - Initialization helpers

- (void)addRefreshControl
{
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(loadCells) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)loadCells
{
}

- (void)assignCustomClassFields
{
    NSAssert(_numberToLoad, @"numberToLoad uninitialized");
    NSAssert(_cellIdentifier
             , @"cellIdentifier uninitialized");
    NSAssert(_entityName, @"entityName uninitialized");
    NSAssert(_sortDescriptorKey, @"sortDescriptorKey uninitialized");
    NSAssert(_segueIdentifier, @"segueIdentifier uninitialized");
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

#pragma mark - Table view data source

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
    _numberToLoad = [NSNumber numberWithInteger:[sectionInfo numberOfObjects]];
    return _numberToLoad.integerValue;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(_cellIdentifier, @"cellIdentifier is nil: make sure that cellIdentifier has been initialized to this TableView's cell identifier");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table View Cell helpers

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(([[self.fetchedResultsController fetchedObjects] count] > 0), @"Trying to fetch objects from empty fetchedResultsController (will result in arrayOutOfBounds) Check that return value from tableView:numberOfRowsInSection is based on number of objects in fetchedResultsController");
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
        
        _numberToLoad = [NSNumber numberWithInt:(_numberToLoad.intValue + 10)];
        NSLog(@"more articles! %@", _numberToLoad);
        
        [self loadCells];
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
    
    // Assign Core Data entity for fetchedResultsController
    NSAssert(_entityName, @"entityName is nil: make sure that entityName has been initialized to this TableView's entity");
    NSEntityDescription *entity = [NSEntityDescription entityForName:_entityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Assign sort descriptor (one of entity's properties)
    NSAssert(_entityName, @"sortDescriptorKey is nil: make sure that sortDescriptorKey has been initialized to this TableView's sortDescriptorKey");
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:_sortDescriptorKey ascending:NO];
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
    NSAssert(_segueIdentifier, @"segueIdentifier is nil: make sure that segueIdentifier has been initialized to this TableView's segue name");
    [self performSegueWithIdentifier:_segueIdentifier sender:[self.tableView cellForRowAtIndexPath:indexPath]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
}

@end
