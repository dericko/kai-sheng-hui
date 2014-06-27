//
//  KSHArticle.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHIndustry, KSHTag, KSHUser;

@interface KSHArticle : NSManagedObject

@property (nonatomic, retain) NSNumber * articleID;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * datePublished;
@property (nonatomic, retain) NSString * excerpt;
@property (nonatomic, retain) id imgURL;
@property (nonatomic, retain) NSString * publisher;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * typeID;
@property (nonatomic, retain) NSNumber * uID;
@property (nonatomic, retain) NSNumber * viewCount;
@property (nonatomic, retain) NSSet *dislikedBy;
@property (nonatomic, retain) NSSet *hasIndustry;
@property (nonatomic, retain) NSSet *hasTag;
@property (nonatomic, retain) NSSet *likedBy;
@end

@interface KSHArticle (CoreDataGeneratedAccessors)

- (void)addDislikedByObject:(KSHUser *)value;
- (void)removeDislikedByObject:(KSHUser *)value;
- (void)addDislikedBy:(NSSet *)values;
- (void)removeDislikedBy:(NSSet *)values;

- (void)addHasIndustryObject:(KSHIndustry *)value;
- (void)removeHasIndustryObject:(KSHIndustry *)value;
- (void)addHasIndustry:(NSSet *)values;
- (void)removeHasIndustry:(NSSet *)values;

- (void)addHasTagObject:(KSHTag *)value;
- (void)removeHasTagObject:(KSHTag *)value;
- (void)addHasTag:(NSSet *)values;
- (void)removeHasTag:(NSSet *)values;

- (void)addLikedByObject:(KSHUser *)value;
- (void)removeLikedByObject:(KSHUser *)value;
- (void)addLikedBy:(NSSet *)values;
- (void)removeLikedBy:(NSSet *)values;

@end
