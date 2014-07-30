//
//  KSHHomescreenTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/29/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSHHomescreenTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

// Managed object context for fetch requests
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

// Two fetched results controller to populate separate sections
@property (nonatomic, strong) NSFetchedResultsController *fetchedResults1;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResults2;

@end
