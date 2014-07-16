//
//  KSHArticleTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSHArticleManager.h"
#import <SWTableViewCell/SWTableViewCell.h>

/** Displays a table of Articles using a KSHArticleManager
 */
@interface KSHArticleTableViewController : UITableViewController <NSFetchedResultsControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) KSHArticleManager *articleManager;

@end
