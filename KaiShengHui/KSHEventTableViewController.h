//
//  KSHEventTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityTableViewController.h"
#import "KSHEventManager.h"

@interface KSHEventTableViewController : KSHEntityTableViewController

@property (nonatomic, strong) KSHEventManager *eventManager;

@end
