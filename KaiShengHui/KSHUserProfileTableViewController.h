//
//  KSHUserProfileTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHUserManager.h"

@interface KSHUserProfileTableViewController : UITableViewController <UserAuthenticationDelegate>
@property (strong, nonatomic) KSHProfile *profile;

@end
