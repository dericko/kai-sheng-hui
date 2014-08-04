//
//  KSHAuthenticatedUserViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/31/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHAuthenticatedUserViewController.h"

@interface KSHAuthenticatedUserViewController ()

@end

@implementation KSHAuthenticatedUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)showLoginScreenIfNeccessary
{
    if (![[KSHUserManager sharedManager] isLoggedIn]) {
		// Register for login succeeded notification
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin) name:UserDidLoginNotification object:nil];
		
		KSHLoginViewController* loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
        [self presentViewController:loginViewController animated:YES completion:NULL];
        
		loginViewController.delegate = self;
	}
}

- (void)userDidLogin
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loginViewControllerDidCancel:(KSHLoginViewController *)loginViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
