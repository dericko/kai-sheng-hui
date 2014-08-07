//
//  KSHArticleTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleTableViewController.h"
#import "KSHContentManager.h"
#import "KSHContentTableViewCell.h"
#import "KSHArticleDetailViewController.h"
#import "KSHSplitButtonView.h"

@interface KSHArticleTableViewController ()
@property (nonatomic, strong) KSHArticle *article;
@property (nonatomic, strong) KSHContentManager *contentManager;

@property (nonatomic, strong) KSHSplitButtonView *splitButtons;
@end

@implementation KSHArticleTableViewController

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
    self.cellIdentifier = @"ArticleCell";
    self.entityName = @"Article";
    self.sortDescriptorKey = @"createDate";
    self.segueIdentifier = @"showArticleDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
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
    
    _article = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    
    ((KSHContentTableViewCell *)cell).titleLabel.text = _article.title;
    // TODO: get API field for Source
    ((KSHContentTableViewCell *)cell).detailLabel1.text = _article.sourceName;
    if (!_article.industryName) [_article setIndustryText];
    ((KSHContentTableViewCell *)cell).detailLabel2.text = _article.industryName;
    [((KSHContentTableViewCell *)cell).detailLabel2 setTextColor:[KSHColorPicker colorForIndustry:_article.industry]];
    ((KSHContentTableViewCell *)cell).detailLabel3.text = _article.tags;
   
    
    UIImageView *articleImageView   = (UIImageView *) [cell viewWithTag:100];
    // Check if image has been downloaded
    if (![_article getImage]) {
        [self setImageAsync: articleImageView atIndexPath:indexPath];
    } else {
        articleImageView.image = [_article getImage];
    }
}

- (void)setImageAsync:(UIImageView *)articleImageView atIndexPath:(NSIndexPath *)indexPath
{
    // Async request and assign cell image
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[_article valueForKey:@"imgURLString"] description]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"ksh-default.jpg"];
    
    // Use UIImageView+AFNetworking to make request and save image
    [articleImageView
     setImageWithURLRequest:request
     placeholderImage:placeholderImage
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
         [[self.fetchedResultsController objectAtIndexPath:indexPath] setImage:image];
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
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
