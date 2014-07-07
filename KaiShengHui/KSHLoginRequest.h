//
//  KSHLoginRequest.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface KSHLoginRequest : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;

@end
