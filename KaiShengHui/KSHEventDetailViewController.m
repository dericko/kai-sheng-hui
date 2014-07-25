//
//  KSHEventDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEventDetailViewController.h"

@interface KSHEventDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *dateLocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *contactLabel;

@end

@implementation KSHEventDetailViewController

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
    NSString *title = [NSString stringWithFormat:@"%@", _event.title];
    NSString *content = [NSString stringWithFormat:@"%@", _event.content];
    // FIXME: Format date properly
    NSString *dateLocation = [NSString stringWithFormat:@"%@ - %@", _event.startDate, _event.region];
    NSString *price = [NSString stringWithFormat:@"Price: ￥%@ / 人", _event.memberPrice];
    NSString *contact = [NSString stringWithFormat:@"%@: %@", _event.contactName, _event.contactEmail];
    
    // Assign content fields
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    self.dateLocationLabel.text = dateLocation;
    self.priceLabel.text = price;
    self.contactLabel.text = contact;
    
}

- (IBAction)viewOnlinePressed:(id)sender {
}


# pragma mark - Bottom Bars Buttons

// FIXME: Make these buttons do something real!
- (IBAction)likePressed:(id)sender {
    
}

- (IBAction)dislikePressed:(id)sender {
    
}

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

@end
