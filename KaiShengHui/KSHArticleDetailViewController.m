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
    NSString *industry = [NSString stringWithFormat:@"%@", _article.industry];
    NSString *tags = [NSString stringWithFormat:@"%@", _article.tags];
    // TODO: use API to get actual source
    NSString *source = [NSString stringWithFormat:@"%@", @"www.iksh.com"];
    NSString *published = [NSString stringWithFormat:@"%@", _article.publishDate];

    // Set content labels
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    _articleIndustry.text = industry;
    _articleTags.text = tags;
    _articleSource.text = source;
    _articleImage.image = [_article getImage];
    _publishDate.text = published;
    
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

@end
