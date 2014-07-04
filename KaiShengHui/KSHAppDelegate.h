//
//  KSHAppDelegate.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>


@interface KSHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) RKManagedObjectStore *managedObjectStore;
@property (strong, nonatomic) NSUserDefaults *defaults;

- (NSURL *)applicationDocumentsDirectory;

@end