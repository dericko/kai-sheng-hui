//
//  KSHArticleTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleTableViewController.h"
#import "KSHMessage.h"
#import "KSHArticleTableViewCell.h"
#import "KSHArticleDetailViewController.h"

@interface KSHArticleTableViewController ()
@property (nonatomic, strong) KSHArticle *article;

@end

@implementation KSHArticleTableViewController

# pragma mark - Initialization

- (void)viewDidLoad
{
    _articleManager = [KSHArticleManager sharedManager];
    _articleManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    [self assignCustomClassFields];
    
    [super viewDidLoad];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @10;
    self.cellIdentifier = @"ArticleCell";
    self.entityName = @"Article";
    self.sortDescriptorKey = @"publishDate";
    self.segueIdentifier = @"showArticleDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_articleManager) {
        [_articleManager
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
    
    _article = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    [(KSHArticleTableViewCell *) cell setRightUtilityButtons:[self rightButtons]];
    
    ((KSHArticleTableViewCell *)cell).titleLabel.text = [[_article valueForKey:@"title"] description];
    // TODO: get API field for Source
    ((KSHArticleTableViewCell *)cell).detailLabel1.text = @"www.iksh.com";
    if (!_article.industry) [_article setIndustryText];
    ((KSHArticleTableViewCell *)cell).detailLabel2.text = [[_article valueForKey:@"industry"] description];;
    ((KSHArticleTableViewCell *)cell).detailLabel3.text = [[_article valueForKey:@"tags"] description];
   
    
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
