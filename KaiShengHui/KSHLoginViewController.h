//
//  KSHLoginViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "KSHLoginManager.h"
#import "KSHUser.h"

@interface KSHLoginViewController : UIViewController <UITextFieldDelegate, MBProgressHUDDelegate>
{
	MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) KSHLoginManager *loginManager;
@property (strong, nonatomic) KSHUser *user;

@end
