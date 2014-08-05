//
//  KSHFavoritesTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/30/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHFavoritesTableViewController.h"
#import "KSHContentManager.h"
#import "KSHContentTableViewCell.h"
#import "KSHArticleDetailViewController.h"
#import "KSHProjectOpportunityDetailViewController.h"
#import "KSHSplitButtonView.h"

@interface KSHFavoritesTableViewController ()

@property (nonatomic, strong) KSHContentManager *contentManager;
@property (nonatomic, strong) KSHArticle *article;

@property (nonatomic, strong) KSHProjectOpportunity *projectOpportunity;

@property (nonatomic, strong) KSHSplitButtonView *splitButtons;

@property BOOL viewArticleMode;
@end

@implementation KSHFavoritesTableViewController

- (void)viewDidLoad
{
    // Set up selector buttons
    _splitButtons = [[KSHSplitButtonView alloc] initWithFrame:CGRectMake(0, 10.0, 142.0, 24.0)];
    [_splitButtons addLeftButtonWithTitle:@"Articles" forTarget:self withAction:@selector(viewArticles)];
    [_splitButtons addRightButtonWithTitle:@"Projects" forTarget:self withAction:@selector(viewProjects)];
    self.navigationItem.titleView = _splitButtons;

    // Setup networking manager/core data stack
    _contentManager = [KSHContentManager sharedManager];
    _contentManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

// TODO: Assign top-buttons to change these fields
- (void)assignCustomClassFields
{
    self.numberToLoad = @10;
    self.entityName = @"Favoritable";
    self.sortDescriptorKey = @"createDate";
    
    [self viewArticles];
    
    [super assignCustomClassFields];
}

- (void)viewArticles
{
    _viewArticleMode = YES;
    
    self.cellIdentifier = @"ArticleCell";
    self.segueIdentifier = @"showArticleDetail";

}

- (void)viewProjects
{
    // FIXME: fetchedResultsController is only setup once. Changing these fields doesn't change fetch request
    // Either use a parent class for entities (e.g. KSHItem) or use two FRCs...
    
    
    _viewArticleMode = NO;
    
    self.cellIdentifier = @"ProjectOpportunityCell";
    self.segueIdentifier = @"showProjectOpportunityDetail";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fetchableType = 3"];
    [self.fetchedResultsController.fetchRequest setPredicate:predicate];
}

- (void)loadCells
{
    if (_viewArticleMode) {
        if (_contentManager) {
            [_contentManager
             loadArticlesWithParameters:nil
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
    } else {
        if (_contentManager) {
            [_contentManager
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
}


#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    if (_viewArticleMode) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fetchableType == 1"];
        [self.fetchedResultsController.fetchRequest setPredicate:predicate];
        
        NSArray *articles = [self.fetchedResultsController fetchedObjects];
        NSLog(@"article array - %@", articles);
        [articles filteredArrayUsingPredicate:predicate];
        NSLog(@"filtered article array - %@", articles);
        
        _article = [articles objectAtIndex:indexPath.row];
        ((KSHContentTableViewCell *)cell).titleLabel.text = [[_article valueForKey:@"title"] description];
        // TODO: get API field for Source
        ((KSHContentTableViewCell *)cell).detailLabel1.text = @"www.iksh.com";
        if (!_article.industryName) [_article setIndustryText];
        ((KSHContentTableViewCell *)cell).detailLabel2.text = [[_article valueForKey:@"industryName"] description];;
        ((KSHContentTableViewCell *)cell).detailLabel3.text = [[_article valueForKey:@"tags"] description];
        
        
        UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:100];
        // Check if image has been downloaded
        if (!_article.imgFile) {
            [self setImageAsync: articleImageView atIndexPath:indexPath];
        } else {
            articleImageView.image = [[self.fetchedResultsController objectAtIndexPath:indexPath] getImage];
        }
        
    } else {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fetchableType == 3"];
        [self.fetchedResultsController.fetchRequest setPredicate:predicate];
        NSArray *articles = [self.fetchedResultsController fetchedObjects];
        [articles filteredArrayUsingPredicate:predicate];
        
        _article = [articles objectAtIndex:indexPath.row];
        // Can typecast to 'cellIdentifer' type specified in Storyboard
        
        ((KSHContentTableViewCell *) cell).titleLabel.text = [[_projectOpportunity valueForKey:@"title"] description];
        ((KSHContentTableViewCell *) cell).descriptionLabel.text = [[_projectOpportunity valueForKey:@"referenceContent"] description];
        ((KSHContentTableViewCell *) cell).detailLabel3.text = [[_projectOpportunity valueForKey:@"deadlineDate"] description];
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


# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KSHArticleDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.article = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    }
}

@end