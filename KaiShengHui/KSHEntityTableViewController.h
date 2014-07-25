//
//  KSHEntityTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Base class for entity-based TableViewControllers that should satisfy <NSFetchedResultsControllerDelegate> for Core Data fetches. Assumes that class will populate itself with an appropriate subclass of KSHObjectManager to handle network requests and entity mapping.
 */
@interface KSHEntityTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) UIView * footerView;
@property (strong, nonatomic) NSNumber *numberToLoad;
@property (strong, nonatomic) NSString *cellIdentifier;
@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSString *sortDescriptorKey;
@property (strong, nonatomic) NSString *segueIdentifier;

/** Override to assign class fields according to instance of table view controller
 NOTE: Make sure to call [super assignCustomClassFields] AFTER assigning each field. Otherwise, assertions will fail.
 */
- (void)assignCustomClassFields;

/** Override to make network request with object manager
 */
- (void)loadCells;

/** Override to configure table view cell
 */
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

// TODO: Setup protocol so that subclasses will satisfy requirements
