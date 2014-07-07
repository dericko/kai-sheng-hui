//
//  KSHLikeable.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface KSHLikeable : NSManagedObject

@property (nonatomic, retain) NSDate * syncedAt;
@property (nonatomic, retain) NSDate * deletedAt;
@property (nonatomic, retain) NSNumber * likedID;
@property (nonatomic, retain) NSString * likedName;

@end
