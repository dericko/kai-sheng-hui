//
//  KSHTag.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHArticle, KSHUser;

@interface KSHTag : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * tagID;
@property (nonatomic, retain) NSSet *dislikedBy;
@property (nonatomic, retain) NSSet *likedBy;
@property (nonatomic, retain) NSSet *tags;
@end

@interface KSHTag (CoreDataGeneratedAccessors)

- (void)addDislikedByObject:(KSHUser *)value;
- (void)removeDislikedByObject:(KSHUser *)value;
- (void)addDislikedBy:(NSSet *)values;
- (void)removeDislikedBy:(NSSet *)values;

- (void)addLikedByObject:(KSHUser *)value;
- (void)removeLikedByObject:(KSHUser *)value;
- (void)addLikedBy:(NSSet *)values;
- (void)removeLikedBy:(NSSet *)values;

- (void)addTagsObject:(KSHArticle *)value;
- (void)removeTagsObject:(KSHArticle *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
