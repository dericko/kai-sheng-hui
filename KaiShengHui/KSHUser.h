//
//  KSHUser.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSHArticle, KSHFunction, KSHIndustry, KSHTag, KSHUser;

@interface KSHUser : NSManagedObject

@property (nonatomic, retain) NSString * avatarURLString;
@property (nonatomic, retain) NSNumber * companyName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSDate * lastLogin;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSDate * signUpDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSSet *dislikesArticle;
@property (nonatomic, retain) NSSet *dislikesTag;
@property (nonatomic, retain) NSSet *follows;
@property (nonatomic, retain) NSSet *likesArticle;
@property (nonatomic, retain) NSSet *likesTag;
@property (nonatomic, retain) KSHIndustry *ofIndustry;
@property (nonatomic, retain) KSHFunction *performsFunction;
@end

@interface KSHUser (CoreDataGeneratedAccessors)

- (void)addDislikesArticleObject:(KSHArticle *)value;
- (void)removeDislikesArticleObject:(KSHArticle *)value;
- (void)addDislikesArticle:(NSSet *)values;
- (void)removeDislikesArticle:(NSSet *)values;

- (void)addDislikesTagObject:(KSHTag *)value;
- (void)removeDislikesTagObject:(KSHTag *)value;
- (void)addDislikesTag:(NSSet *)values;
- (void)removeDislikesTag:(NSSet *)values;

- (void)addFollowsObject:(KSHUser *)value;
- (void)removeFollowsObject:(KSHUser *)value;
- (void)addFollows:(NSSet *)values;
- (void)removeFollows:(NSSet *)values;

- (void)addLikesArticleObject:(KSHArticle *)value;
- (void)removeLikesArticleObject:(KSHArticle *)value;
- (void)addLikesArticle:(NSSet *)values;
- (void)removeLikesArticle:(NSSet *)values;

- (void)addLikesTagObject:(KSHTag *)value;
- (void)removeLikesTagObject:(KSHTag *)value;
- (void)addLikesTag:(NSSet *)values;
- (void)removeLikesTag:(NSSet *)values;

@end
