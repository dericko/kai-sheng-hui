// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLike.h instead.

#import <CoreData/CoreData.h>
#import "KSHLikeDislike.h"

extern const struct KSHLikeAttributes {
} KSHLikeAttributes;

extern const struct KSHLikeRelationships {
	__unsafe_unretained NSString *article;
	__unsafe_unretained NSString *tag;
	__unsafe_unretained NSString *user;
} KSHLikeRelationships;

extern const struct KSHLikeFetchedProperties {
} KSHLikeFetchedProperties;

@class KSHArticle;
@class KSHTag;
@class KSHUser;


@interface KSHLikeID : NSManagedObjectID {}
@end

@interface _KSHLike : KSHLikeDislike {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHLikeID*)objectID;





@property (nonatomic, strong) KSHArticle *article;

//- (BOOL)validateArticle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) KSHTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) KSHUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHLike (CoreDataGeneratedAccessors)

@end

@interface _KSHLike (CoreDataGeneratedPrimitiveAccessors)



- (KSHArticle*)primitiveArticle;
- (void)setPrimitiveArticle:(KSHArticle*)value;



- (KSHTag*)primitiveTag;
- (void)setPrimitiveTag:(KSHTag*)value;



- (KSHUser*)primitiveUser;
- (void)setPrimitiveUser:(KSHUser*)value;


@end
