//
//  KSHLogin.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/3/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHUser;

@interface KSHLogin : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) KSHUser *user;

@end
