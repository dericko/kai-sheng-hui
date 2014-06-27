//
//  KSHIndustry.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHArticle, KSHFunction, KSHUser;

@interface KSHIndustry : NSManagedObject

@property (nonatomic, retain) NSNumber * industryID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *hasArticle;
@property (nonatomic, retain) NSSet *hasFunction;
@property (nonatomic, retain) NSSet *hasUser;
@end

@interface KSHIndustry (CoreDataGeneratedAccessors)

- (void)addHasArticleObject:(KSHArticle *)value;
- (void)removeHasArticleObject:(KSHArticle *)value;
- (void)addHasArticle:(NSSet *)values;
- (void)removeHasArticle:(NSSet *)values;

- (void)addHasFunctionObject:(KSHFunction *)value;
- (void)removeHasFunctionObject:(KSHFunction *)value;
- (void)addHasFunction:(NSSet *)values;
- (void)removeHasFunction:(NSSet *)values;

- (void)addHasUserObject:(KSHUser *)value;
- (void)removeHasUserObject:(KSHUser *)value;
- (void)addHasUser:(NSSet *)values;
- (void)removeHasUser:(NSSet *)values;

@end
