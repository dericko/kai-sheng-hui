//
//  KSHProjectTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityTableViewController.h"
#import "KSHProjectOpportunityManager.h"

@interface KSHProjectTableViewController : KSHEntityTableViewController

@property (nonatomic, strong) KSHProjectOpportunityManager *projectOpportunityManager;

@end
