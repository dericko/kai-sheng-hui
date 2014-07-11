//
//  KSHSideBarTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHSideBarTableViewController.h"
#import "SWRevealViewController.h"
#import "KSHUserDefaultsHelper.h"

@interface KSHSideBarTableViewController ()

@end

@implementation KSHSideBarTableViewController
{
    NSArray *menuItems;
}

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
    
    menuItems = @[@"myKSH", @"Profile", @"Content", @"Projects", @"Events", @"Contacts", @"Jobs", @"Opportunities"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menuItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: change to just two identifiers: Profile and MenuItemCell
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
 
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    UILabel *menuItemLabel = (UILabel *)[cell viewWithTag:200];
    menuItemLabel.text = [menuItems objectAtIndex:indexPath.row];
    
    UIImageView *menuItemImage = (UIImageView *) [cell viewWithTag:201];
    menuItemImage.image = [UIImage imageNamed:@"placeholder-square.jpg"];
}
- (IBAction)profileIsClicked:(id)sender
{
    // TODO: set up routing for profile or login view
    
    NSLog([NSString stringWithFormat:@"Logged in? ... %hhu", [KSHUserDefaultsHelper isUserLoggedIn]]);
    NSString *controllerId = ([KSHUserDefaultsHelper isUserLoggedIn]) ? @"UserProfile" : @"Login";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:controllerId];
    SWRevealViewControllerSegue *showNextView = [SWRevealViewControllerSegue segueWithIdentifier:controllerId source:self destination:nextViewController performHandler:^{
    }];
    showNextView.performBlock = ^(SWRevealViewControllerSegue *rvc_segue, UIViewController *svc, UIViewController *dvc) {
        
        UINavigationController *navController = (UINavigationController *)self.revealViewController.frontViewController;
        [navController setViewControllers: @[dvc] animated: NO ];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    };
    
    [showNextView perform];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destinationViewController = (UINavigationController*)segue.destinationViewController;
    destinationViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];

    // TODO: set the HTTP call parameters for displaying articles according to industry    
    
    // handle segues
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue *rvc_segue, UIViewController *svc, UIViewController *dvc) {
            
            UINavigationController *navController = (UINavigationController *)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
}


@end
