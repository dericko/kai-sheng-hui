//
//  KSHFunction.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHIndustry, KSHUser;

@interface KSHFunction : NSManagedObject

@property (nonatomic, retain) NSNumber * functionID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *hasUser;
@property (nonatomic, retain) NSSet *ofIndustry;
@end

@interface KSHFunction (CoreDataGeneratedAccessors)

- (void)addHasUserObject:(KSHUser *)value;
- (void)removeHasUserObject:(KSHUser *)value;
- (void)addHasUser:(NSSet *)values;
- (void)removeHasUser:(NSSet *)values;

- (void)addOfIndustryObject:(KSHIndustry *)value;
- (void)removeOfIndustryObject:(KSHIndustry *)value;
- (void)addOfIndustry:(NSSet *)values;
- (void)removeOfIndustry:(NSSet *)values;

@end
