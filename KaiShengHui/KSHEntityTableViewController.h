//
//  KSHEntityTableViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

/** This is the base class for Article Tables, Project Opportunity Tables, and other entity-based TableViewController that uses a single NSFetchedResultsController to populate a single-section table. Assumes that subclasses will provide a KSHObjectManager subclass to handle network requests and entity mapping.
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
