//
//  KSHUserDefaultsHelper.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSHUserDefaultsHelper : NSUserDefaults

+ (void)initUserDefaults:(NSUserDefaults *)defaults;

+ (void)userLogin;
+ (void)userLogout;

+ (BOOL)isUserLoggedIn;

@end
