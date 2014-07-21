//
//  DLOAppDelegate.h
//  holder
//
//  Created by Derick Olson on 7/21/14.
//  Copyright (c) 2014 tatloong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
