//
//  KSHSettingsTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHSettingsTableViewController.h"
#import "KSHWebViewController.h"

@interface KSHSettingsTableViewController ()

@end

@implementation KSHSettingsTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showAboutCapvision"]) {
        KSHWebViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.url = @"http://www.iksh.com/cooperation?tid=704";
    } else if ([segue.identifier isEqualToString:@"showMemberServices"]) {
        KSHWebViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.url = @"http://www.iksh.com/member";
    }
}


@end
