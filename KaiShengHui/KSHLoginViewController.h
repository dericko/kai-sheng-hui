//
//  KSHLoginViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "KSHUserManager.h"

@protocol LoginViewControllerDelegate;

@interface KSHLoginViewController : UIViewController <UITextFieldDelegate, UserAuthenticationDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) KSHUserManager *userManager;

@property (strong, nonatomic) NSObject<LoginViewControllerDelegate> *delegate;

@end

@protocol LoginViewControllerDelegate <NSObject>

- (void)loginViewControllerDidCancel:(KSHLoginViewController *)loginViewController;

@end