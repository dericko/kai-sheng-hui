//
//  KSHUserDefaultsHelper.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>

// ???: Is there an Apple Library or PList for this?
/** Helper for storing user login status in NSUserDefaults dictionary
 */
@interface KSHUserDefaultsHelper : NSUserDefaults

+ (void)initUserDefaults:(NSUserDefaults *)defaults;

+ (void)userLogin;
+ (void)userLogout;

+ (BOOL)isUserLoggedIn;

@end
