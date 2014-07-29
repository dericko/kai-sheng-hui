//
//  KSHAppDelegate.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "KSHAppDelegate.h"
#import "KSHArticleManager.h"
#import "KSHArticleTableViewController.h"
#import "KSHUserDefaultsHelper.h"

@interface KSHAppDelegate ()
@end

@implementation KSHAppDelegate

@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectStore = _RKManagedObjectStore;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeRestkitForCoreData];
    
    // Set up user login defaults
    // TODO: persist log in status
    if (!_defaults) {
        [KSHUserDefaultsHelper initUserDefaults:_defaults];
    }
    
    // !!!: Assume user is logged in for testing purposes
    [KSHUserDefaultsHelper userLogin];
    
    // Set initial controller depending on login status
    NSString *controllerID = [KSHUserDefaultsHelper isUserLoggedIn] ? @"TabBar" : @"Landing";
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:controllerID];
    if ([KSHUserDefaultsHelper isUserLoggedIn]) {
        [self.window setRootViewController:initViewController];
    } else {
        [(UINavigationController *)self.window.rootViewController pushViewController:initViewController animated:NO];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
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
    
    // Restkit automatically saves context when calling success block :)
}

#pragma mark - Restkit + CoreData

- (void)initializeRestkitForCoreData
{
    // Log all Restkit info
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    
    // Restkit managed object store
    _RKManagedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:[self managedObjectModel]];
    

    // FIXME: need to support migrations when using persistent store - currently requires "Reset Content and Settings" in simulator
    // Set up persistent store
    [_RKManagedObjectStore createPersistentStoreCoordinator];
    // !!! For Development: use addInMemoryPersistentStore to avoid SQLite migration problem
//    NSString *storeURL = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"KaiShengHui.sqlite"];
    NSError *error = nil;
    NSPersistentStore *persistentStore = [_RKManagedObjectStore addInMemoryPersistentStore:&error];
//    NSPersistentStore *persistentStore = [_RKManagedObjectStore addSQLitePersistentStoreAtPath:storeURL fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    // Managed object context
    [_RKManagedObjectStore createManagedObjectContexts];
    
    
    [RKManagedObjectStore setDefaultStore:_RKManagedObjectStore];
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
