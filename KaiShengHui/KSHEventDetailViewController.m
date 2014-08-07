//
//  KSHEventDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventDetailViewController.h"
#import "KSHWebViewController.h"
#import "KSHColorPicker.h"
#import "KSHDetailToolbarView.h"
#import "KSHUserManager.h"

@interface KSHEventDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *contactLabel;

@property (strong, nonatomic) KSHDetailToolbarView *toolbarView;
@end

@implementation KSHEventDetailViewController

- (void)viewDidLoad
{
    // Setup toolbar
    _toolbarView = [[KSHDetailToolbarView alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 30.0)];
    [_toolbarView addResizeButtonForTarget:self action:@selector(toggleFont)];
    [_toolbarView addShareButtonForTarget:self action:@selector(share)];
    UIBarButtonItem *toolbar = [[UIBarButtonItem alloc] initWithCustomView:_toolbarView];
    [self.navigationItem setRightBarButtonItem:toolbar];
    
    
    // Assign content fields
    self.titleLabel.text = _event.title;
    self.contentLabel.text = _event.content;
    self.dateLabel.text = [NSString stringWithFormat:@"%@",_event.startDate];
    self.locationLabel.text = _event.region;
    [self.locationLabel setBackgroundColor:[KSHColorPicker colorForLocation:_event.region]];
    self.priceLabel.text = [NSString stringWithFormat:@"Price: ￥%@ / 人", _event.memberPrice];
    self.contactLabel.text = [NSString stringWithFormat:@"%@: %@", _event.contactName, _event.contactEmail];
    
    [super viewDidLoad];
}

# pragma mark - Buttons


- (IBAction)emailPressed:(id)sender {
}

- (void)share
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (_event.urlString) {
        [sharingItems addObject:_event.urlString];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewWebpage"]) {
        KSHWebViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.url = _event.urlString;
    }
}

@end
