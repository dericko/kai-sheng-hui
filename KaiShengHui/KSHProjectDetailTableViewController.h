//
//  KSHProjectDetailTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityTableViewController.h"
#import "KSHProject.h"
#import "KSHUserManager.h"

@interface KSHProjectDetailTableViewController : KSHEntityTableViewController

@property (nonatomic, strong) KSHProject *project;
@property (nonatomic, strong) KSHUserManager *userManager;

@end
