//
//  KSHArticleDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/10/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface KSHArticleDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *articleTags;
@property (strong, nonatomic) IBOutlet UILabel *articleIndustry;
@property (strong, nonatomic) IBOutlet UILabel *articleSource;
@property (nonatomic, strong) IBOutlet UIImageView *articleImage;
@property (strong, nonatomic) IBOutlet UILabel *publishDate;

@property (strong, nonatomic) IBOutlet UIButton *upvoteButton;
@property (strong, nonatomic) IBOutlet UIButton *downvoteButton;

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
    // Clean up content for html remnants
    [self cleanUpContent];
    
    // Set content fields
    NSString *title = [NSString stringWithFormat:@"%@", _article.title];
    NSString *content = [NSString stringWithFormat:@"%@", _article.content];
    if (!_article.industryName) [_article setIndustryText];
    NSString *industry = [NSString stringWithFormat:@"%@", _article.industryName];
    NSString *tags = [NSString stringWithFormat:@"%@", _article.tags];
    // TODO: use API to get actual source
    NSString *source = [NSString stringWithFormat:@"%@", @"www.iksh.com"];
    NSString *published = [NSString stringWithFormat:@"%@", _article.createDate];

    // Set content labels
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    _articleIndustry.text = industry;
    _articleTags.text = tags;
    _articleSource.text = source;
    _publishDate.text = published;
    
    if ([_article getImage]) {
        _articleImage.image = [_article getImage];
    } else {
        [self getImage];
    }
    
    
    
    [super viewDidLoad];
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

- (void)getImage
{
    // Set image
    UIImage *placeholderImage = [UIImage imageNamed:@"ksh-default.jpg"];
    UIImageView *placeholderImageView = [[UIImageView alloc] initWithImage:placeholderImage];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[_article valueForKey:@"imgURLString"] description]]]];
    [placeholderImageView
     setImageWithURLRequest:request
     placeholderImage:placeholderImage
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
         _articleImage.image = image;
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
         [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error  localizedDescription]];
         NSLog(@"Error: %@", error);
     }];
}

# pragma mark - Bottom Bars Buttons

// FIXME: Make these buttons do something real!
- (IBAction)likePressed:(id)sender {
    _upvoteButton.selected = !_upvoteButton.selected;
    _downvoteButton.selected = NO;
}
- (IBAction)dislikePressed:(id)sender {
    _downvoteButton.selected = !_downvoteButton.selected;
    _upvoteButton.selected = NO;
}
- (IBAction)favoritePressed:(id)sender {
    self.starButton.selected = !self.starButton.selected;
}
- (IBAction)sharePressed:(id)sender {
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (_article.content) {
        [sharingItems addObject:_article.content];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)share
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (_article.content) {
        [sharingItems addObject:_article.content];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

@end
