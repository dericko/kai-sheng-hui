//
//  KSHUserProfileTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUserProfileTableViewController.h"
#import "KSHProfileTableViewCell.h"
#import "KSHHomescreenTableViewController.h"
#import "KSHUserManager.h"
#import "KSHDetailIconTableViewCell.h"

@interface KSHUserProfileTableViewController ()

@property NSArray *userDetails;
@end

@implementation KSHUserProfileTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up user detail list
    _userDetails = [NSArray arrayWithObjects:@"Name", @"Email", @"Industry", @"Position", @"Specialty",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOutButtonPressed:(id)sender
{
    // Logout
    [[KSHUserManager sharedManager] logoutWithDelegate:self];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return [_userDetails count];
        default:
            // Should not get here
            return 0;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    switch (indexPath.section) {
        case 0:
            // Username section
            cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
            ((KSHDetailIconTableViewCell *) cell).titleLabel.text = [KSHUser currentUser].username;
            ((KSHDetailIconTableViewCell *) cell).iconView.image = [UIImage imageNamed:@"myksh-icon.png"];
            break;
        case 1:
            // Profile section
            cell = [tableView dequeueReusableCellWithIdentifier:@"profileCell" forIndexPath:indexPath];
            ((KSHProfileTableViewCell *) cell).profileTextView.text = _profile.profile;
            break;
            break;
        case 2:
            // User detail section
            cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
            cell.textLabel.text = [_userDetails objectAtIndex:indexPath.row];
            [self configureCell:cell forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            cell.detailTextLabel.text = _profile.name;
            break;
        case 1:
            cell.detailTextLabel.text = [KSHUser currentUser].email;
            break;
        case 2:
            cell.detailTextLabel.text = [_profile getIndustryName];
            break;
        case 3:
            cell.detailTextLabel.text = _profile.position;
            break;
        case 4:
            cell.detailTextLabel.text = _profile.specialty;
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 100;
        case 1:
            // Adjust height according to profile text view
        default:
            return 44;
    }
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

#pragma mark - UserAuthenticationDelegate

- (void)userDidLogout:(KSHUser *)user
{
    // Return to homeview
    [self.tabBarController setSelectedIndex:0];
    
    // Pop navigation controller back to MyKSH page
    [self.navigationController popViewControllerAnimated:NO];
}

@end
