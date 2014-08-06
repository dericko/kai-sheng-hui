//
//  KSHMyKSHTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMyKSHTableViewController.h"
#import "KSHUserManager.h"
#import "KSHUserProfileTableViewController.h"
#import "KSHProjectTableViewController.h"
#import "KSHDetailIconTableViewCell.h"

@interface KSHMyKSHTableViewController ()
@property NSArray *myItems;
@property NSArray *myItemImages;

@property (strong, nonatomic) KSHProfile *profile;

@end

@implementation KSHMyKSHTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // Setup User items
    _myItems = [NSArray arrayWithObjects:@"我的项目",nil];
    _myItemImages = [NSArray arrayWithObjects:@"project-icon.png", nil];

    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    _profile = [KSHUser currentUser].userProfile;
    [self.tableView reloadData];
    
    // Get the current user's profile
//    [[KSHUserManager sharedManager]
//     loadProfileForUser:[KSHUser currentUser]
//     success:^{
//         _profile = [KSHUser currentUser].userProfile;
//         [self.tableView reloadData];
//         NSLog(@"Hello, %@", _profile.name);
//     } failure:^(NSError *error) {
//         [KSHMessage displayErrorAlert:@"There was a problem" withSubtitle:[NSString stringWithFormat:@"%@", error]];
//     }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
        case 1:
            return [_myItems count];
        default:
            // Should not reach this default case!
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KSHDetailIconTableViewCell *cell = [KSHDetailIconTableViewCell new];
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"viewProfileCell" forIndexPath:indexPath];
            cell.titleLabel.text = [KSHUser currentUser].username;
            cell.iconView.image = [UIImage imageNamed:@"myksh-icon.png"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"viewProjectsCell" forIndexPath:indexPath];
            cell.textLabel.text = [_myItems objectAtIndex:indexPath.row];
            cell.iconView.image = [UIImage imageNamed:[_myItemImages objectAtIndex:indexPath.row]];
            
            // TODO: setup number of items for user item (projects, articles, events, points)
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 140;
            break;
        default:
            return 80;
            break;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showUserProfile"]) {
        KSHUserProfileTableViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.profile = _profile;
    }
}


@end
