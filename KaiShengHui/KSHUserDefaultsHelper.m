//
//  KSHUserDefaultsHelper.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUserDefaultsHelper.h"

@implementation KSHUserDefaultsHelper

+ (void)initUserDefaults:(NSUserDefaults *)defaults
{
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"signedIn"];
    [defaults synchronize];
}

+ (void)userLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults willChangeValueForKey:@"signedIn"];
    [defaults setBool:YES forKey:@"signedIn"];
    [defaults didChangeValueForKey:@"signedIn"];
    
    NSLog(@"signing in...");
}

+ (void)userLogout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults willChangeValueForKey:@"signedIn"];
    [defaults setBool:NO forKey:@"signedIn"];
    [defaults didChangeValueForKey:@"signedIn"];
    
    NSLog(@"signing out...");
}

+ (BOOL)isUserLoggedIn
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:@"signedIn"];
}

@end
