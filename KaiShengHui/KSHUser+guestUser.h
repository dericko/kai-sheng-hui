//
//  KSHUser+guestUser.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUser.h"

@interface KSHUser (guestUser)

- (void)setupGuestUserWithContext:(NSManagedObjectContext *)managedObjectContext;

@end
