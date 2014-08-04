//
//  KSHAuthenticatedUserViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/31/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHLoginViewController.h"


@interface KSHAuthenticatedUserViewController : UITabBarController <LoginViewControllerDelegate>

- (void)showLoginScreenIfNeccessary;

- (void)userDidLogin;

- (void)loginViewControllerDidCancel:(KSHLoginViewController *)loginViewController;

@end