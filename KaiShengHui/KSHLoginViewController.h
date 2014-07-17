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

@interface KSHLoginViewController : UIViewController <UITextFieldDelegate, MBProgressHUDDelegate>
{
	MBProgressHUD *HUD;
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) KSHUserManager *userManager;

@end
