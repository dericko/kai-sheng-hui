//
//  KSHTag.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Dislike, KSHArticle, Like;

@interface KSHTag : NSManagedObject

@property (nonatomic, retain) NSNumber * tagID;
@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) NSSet *liked;
@property (nonatomic, retain) NSSet *disliked;
@property (nonatomic, retain) KSHArticle *ofArticle;
@end

@interface KSHTag (CoreDataGeneratedAccessors)

- (void)addLikedObject:(Like *)value;
- (void)removeLikedObject:(Like *)value;
- (void)addLiked:(NSSet *)values;
- (void)removeLiked:(NSSet *)values;

- (void)addDislikedObject:(Dislike *)value;
- (void)removeDislikedObject:(Dislike *)value;
- (void)addDisliked:(NSSet *)values;
- (void)removeDisliked:(NSSet *)values;

@end
