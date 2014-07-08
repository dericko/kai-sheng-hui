//
//  KSHUserProfileTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUserProfileTableViewController.h"
#import "SWRevealViewController.h"
#import "KSHUser.h"
#import "KSHLikeDislike.h"
#import "KSHMessage.h"
#import "KSHUserDefaultsHelper.h"

@interface KSHUserProfileTableViewController ()
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end

@implementation KSHUserProfileTableViewController

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
    
    // Configure sidebar reveal button
    [self.revealButtonItem setTarget: self.revealViewController];
    [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    
    
    if (_user) {        
        _nameLabel.text = [NSString stringWithFormat:@"%@ %@", _user.firstName, _user.lastName];
        _usernameLabel.text = _user.username;
        _emailLabel.text = _user.email;
        _industryLabel.text = _user.industry;
        _functionLabel.text = _user.function;
        
        _likesCount.text = [NSString stringWithFormat:@"%i", [_user.likes count]];
        _dislikesCount.text = [NSString stringWithFormat:@"%i", [_user.dislikes count]];
        _followingCount.text = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signOutButtonPressed:(id)sender
{
    // dealloc user and login objects
    // set global SIGNED_IN to false
    [KSHUserDefaultsHelper userLogout];
    
    //[self performSegueWithIdentifier:@"showProfile" sender:self.view];
    
    NSString *controllerId = @"ArticleTable";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:controllerId];
    SWRevealViewControllerSegue *showNextView = [SWRevealViewControllerSegue segueWithIdentifier:controllerId source:self destination:nextViewController performHandler:^{
    }];
    showNextView.performBlock = ^(SWRevealViewControllerSegue *rvc_segue, UIViewController *svc, UIViewController *dvc) {
        
        UINavigationController *navController = (UINavigationController *)self.revealViewController.frontViewController;
        [navController setViewControllers: @[dvc] animated: NO ];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    };
    
    [KSHMessage displayWarningAlert:@"You have signed out." withSubtitle:@""];
    
    [showNextView perform];
    
    
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
