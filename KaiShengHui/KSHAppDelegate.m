//
//  KSHAppDelegate.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "KSHAppDelegate.h"
#import "KSHArticleTableViewController.h"
#import "KSHUserDefaultsHelper.h"

@interface KSHAppDelegate ()
@end

@implementation KSHAppDelegate

@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectStore = _managedObjectStore;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeRestkitForCoreData];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSError *error = nil;
    [_managedObjectStore.mainQueueManagedObjectContext save:&error];
    if (error) {
        NSLog(@"Could not save context: %@", [error localizedDescription]);
    }
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    
    NSError *error = nil;
    [_managedObjectStore.mainQueueManagedObjectContext save:&error];
    if (error) {
        NSLog(@"Could not save context: %@", [error localizedDescription]);
    }
}

#pragma mark - Restkit + CoreData

- (void)initializeRestkitForCoreData
{
    // To log all requests and responses, use RKLogLevelDebug
    // To log all calls as well as the content, use RKLogLevelTrace
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    
    // Initialize a Restkit managed object store with our Core Data model
    _managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:[self managedObjectModel]];
    

    // FIXME: need to support migrations when using persistent store - currently requires "Reset Content and Settings" in simulator
    // Set up persistent store for our managed object store
    [_managedObjectStore createPersistentStoreCoordinator];
    NSError *error = nil;
    // !!! For Development: use addInMemoryPersistentStore to avoid SQLite migration problem, use addSQLitePersistenStore for deployment
    NSPersistentStore *persistentStore = [_managedObjectStore addInMemoryPersistentStore:&error];
//    NSString *storeURL = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"KaiShengHui.sqlite"];
//    NSPersistentStore *persistentStore = [_managedObjectStore addSQLitePersistentStoreAtPath:storeURL fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    // Managed object context
    [_managedObjectStore createManagedObjectContexts];
    
    
    [RKManagedObjectStore setDefaultStore:_managedObjectStore];
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    // Use default Core Data model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"KaiShengHui" withExtension:@"momd"];
    _managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    return _managedObjectModel;
}


#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
