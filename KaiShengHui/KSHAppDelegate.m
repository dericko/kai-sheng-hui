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
#import "KSHUserManager.h"
#import "KSHArticleTableViewController.h"

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
        _defaults = [NSUserDefaults standardUserDefaults];
        [_defaults setObject:@"" forKey:@"username"];
        [_defaults setObject:@"" forKey:@"password"];
        [_defaults setBool:NO forKey:@"signedIn"];
        [_defaults synchronize];
    }
    
    // Set up initial view controller (can add login auth screen here)
//    NSString *controllerID = @"ArticleTable"; // can add multiple options with ? operator
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    KSHArticleTableViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:controllerID];
//    
//    initViewController.managedObjectStore = _RKManagedObjectStore;
//    
//    [self.window setRootViewController:initViewController];
    
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

#pragma mark - Core Data stack with Restkit Overide

- (void)initializeRestkitForCoreData
{
    // Logs all Restkit info
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    
    _RKManagedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    
    // Initialize Core Data Stack
    [_RKManagedObjectStore createPersistentStoreCoordinator];
    NSError *error = nil;
    NSPersistentStore __unused *persistentStore = [_RKManagedObjectStore addInMemoryPersistentStore:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [_RKManagedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:_RKManagedObjectStore];
    
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
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
