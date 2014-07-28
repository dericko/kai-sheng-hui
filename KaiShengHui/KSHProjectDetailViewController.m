//
//  KSHProjectDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectDetailViewController.h"
#import "KSHWebViewController.h"

@interface KSHProjectDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *deadlineLabel;

@end

@implementation KSHProjectDetailViewController

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
    
    // Set content fields
    NSString *title = [NSString stringWithFormat:@"%@", _projectOpportunity.title];
    NSString *content = [NSString stringWithFormat:@"理想背景: \n %@ \n\n 关键问题: %@", _projectOpportunity.idealBackground, _projectOpportunity.referenceContent];
    NSString *publishDate = [NSString stringWithFormat:@"发布时间: %@", _projectOpportunity.publishDate];
    NSString *deadline = [NSString stringWithFormat:@"截止日期: %@", _projectOpportunity.deadlineDate];
    // Assign content fields
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    self.publishDateLabel.text = publishDate;
    self.deadlineLabel.text = deadline;
}

# pragma mark - Bottom Bars Buttons

// FIXME: Make these buttons do something real!

- (IBAction)favoritePressed:(id)sender {
    
}
- (IBAction)sharePressed:(id)sender {
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (self.contentLabel.text) {
        [sharingItems addObject:self.contentLabel.text];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewWebpage"]) {
        KSHWebViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.url = _projectOpportunity.urlString;
    }
}


@end
