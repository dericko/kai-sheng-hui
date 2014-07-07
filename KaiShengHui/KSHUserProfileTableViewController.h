//
//  KSHUserProfileTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHUser.h"

@interface KSHUserProfileTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *industryLabel;
@property (strong, nonatomic) IBOutlet UILabel *functionLabel;
@property (strong, nonatomic) IBOutlet UILabel *likesCount;
@property (strong, nonatomic) IBOutlet UILabel *dislikesCount;
@property (strong, nonatomic) IBOutlet UILabel *followingCount;

@property (strong, nonatomic) KSHUser *user;

@end
