//
//  KSHArticle.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHDislike, KSHLike, KSHTag;

@interface KSHArticle : NSManagedObject

@property (nonatomic, retain) NSNumber * articleID;
@property (nonatomic, retain) NSNumber * author;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * datePublished;
@property (nonatomic, retain) NSDate * dateUpdated;
@property (nonatomic, retain) NSString * excerpt;
@property (nonatomic, retain) NSString * function;
@property (nonatomic, retain) NSNumber * functionID;
@property (nonatomic, retain) NSData * imgFile;
@property (nonatomic, retain) NSString * imgURLString;
@property (nonatomic, retain) NSString * industry;
@property (nonatomic, retain) NSNumber * industryID;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * typeID;
@property (nonatomic, retain) NSNumber * viewCount;
@property (nonatomic, retain) NSSet *hasTags;
@property (nonatomic, retain) NSSet *disliked;
@property (nonatomic, retain) NSSet *liked;
@end

@interface KSHArticle (CoreDataGeneratedAccessors)

- (void)addHasTagsObject:(KSHTag *)value;
- (void)removeHasTagsObject:(KSHTag *)value;
- (void)addHasTags:(NSSet *)values;
- (void)removeHasTags:(NSSet *)values;

- (void)addDislikedObject:(KSHDislike *)value;
- (void)removeDislikedObject:(KSHDislike *)value;
- (void)addDisliked:(NSSet *)values;
- (void)removeDisliked:(NSSet *)values;

- (void)addLikedObject:(KSHLike *)value;
- (void)removeLikedObject:(KSHLike *)value;
- (void)addLiked:(NSSet *)values;
- (void)removeLiked:(NSSet *)values;

@end
