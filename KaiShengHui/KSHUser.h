//
//  KSHUser.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHDislike, KSHLike;

@interface KSHUser : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSData * imgFile;
@property (nonatomic, retain) NSString * imgURLString;
@property (nonatomic, retain) NSString * industry;
@property (nonatomic, retain) NSNumber * industryID;
@property (nonatomic, retain) NSDate * lastLoginDate;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSDate * signupDate;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * function;
@property (nonatomic, retain) NSNumber * functionID;
@property (nonatomic, retain) NSSet *likes;
@property (nonatomic, retain) NSSet *dislikes;
@end

@interface KSHUser (CoreDataGeneratedAccessors)

- (void)addLikesObject:(KSHLike *)value;
- (void)removeLikesObject:(KSHLike *)value;
- (void)addLikes:(NSSet *)values;
- (void)removeLikes:(NSSet *)values;

- (void)addDislikesObject:(KSHDislike *)value;
- (void)removeDislikesObject:(KSHDislike *)value;
- (void)addDislikes:(NSSet *)values;
- (void)removeDislikes:(NSSet *)values;

@end
