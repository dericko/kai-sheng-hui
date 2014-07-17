//
//  KSHArticleDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/10/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleDetailViewController.h"

#import "KSHMessage.h"

@interface KSHArticleDetailViewController ()
@end

@implementation KSHArticleDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Clean up content for html remnants
    [self cleanUpContent];
    
    // Set content fields
    _articleTitle.text = _article.title;
    _articleContent.text = _article.content;
    _articleIndustry.text = _article.industry;
    _articleTags.text = _article.tags;
    _articleImage.image = [_article getImage];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    // Update content container to fit Title Content, Article Content, and Bottom Bar Controls
    _heightConstraint.constant = _articleContent.contentSize.height + _titleAreaHeightConstraint.constant + _bottomAreaHeightConstraint.constant;
    
    // Update content size of scroll view
    _scrollView.contentSize = self.containerView.frame.size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cleanUpContent
{
    // TODO: Use Regex to support full html-to-plaintext cleanup
    // FIXME: This should probably be in the Article class as part of initialization, but ran into bugs since Article is fetched multiple times (and cannot override init becuase of CoreData)
    NSLog(@"Cleaning up content");
    
    _article.content = [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&rdquo"] withString:@"\""];
    _article.content = [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&ldquo"] withString:@"\""];
    _article.content = [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&rsquo"] withString:@"\'"];
    _article.content = [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&lsquo"] withString:@"\'"];
    _article.content= [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&mdash;"] withString:@"-"];
    _article.content= [_article.content stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"&nbsp;"] withString:@""];
    _article.content = [_article.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

# pragma mark - Bottom Bar Buttons

// FIXME: Make these buttons do something real!
- (IBAction)likePressed:(id)sender {
    [KSHMessage displayMessageAlert:@"Liked!" withSubtitle:@"We'll show you more articles like this"];
}
- (IBAction)dislikePressed:(id)sender {
    [KSHMessage displayMessageAlert:@"Disliked" withSubtitle:@"We'll show you fewer articles like this"];
}
- (IBAction)favoritePressed:(id)sender {
    [KSHMessage displaySuccessAlert:@"Added To Favorites" withSubtitle:@""];
}
- (IBAction)sharePressed:(id)sender {
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (_article.content) {
        [sharingItems addObject:_article.content];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

@end
