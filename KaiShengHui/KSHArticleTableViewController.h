//
//  KSHArticleTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHEntityTableViewController.h"
#import "KSHArticleManager.h"

@interface KSHArticleTableViewController : KSHEntityTableViewController

@property (nonatomic, strong) KSHArticleManager *articleManager;

@end
