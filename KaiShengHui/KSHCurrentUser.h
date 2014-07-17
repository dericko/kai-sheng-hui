//
//  KSHCurrentUser.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/17/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSHCurrentUser : NSObject

- (BOOL)isLoggedIn;
- (void)clearSavedCredentials;
- (NSString *)authToken;
- (void)setAuthToken:(NSString *)authToken;

@end
