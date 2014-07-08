//
//  KSHTag.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHArticle, KSHDislike, KSHLike;

@interface KSHTag : NSManagedObject

@property (nonatomic, retain) NSNumber * tagID;
@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) KSHArticle *ofArticle;
@property (nonatomic, retain) NSSet *disliked;
@property (nonatomic, retain) NSSet *liked;
@end

@interface KSHTag (CoreDataGeneratedAccessors)

- (void)addDislikedObject:(KSHDislike *)value;
- (void)removeDislikedObject:(KSHDislike *)value;
- (void)addDisliked:(NSSet *)values;
- (void)removeDisliked:(NSSet *)values;

- (void)addLikedObject:(KSHLike *)value;
- (void)removeLikedObject:(KSHLike *)value;
- (void)addLiked:(NSSet *)values;
- (void)removeLiked:(NSSet *)values;

@end
