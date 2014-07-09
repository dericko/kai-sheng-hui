// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHStar.h instead.

#import <CoreData/CoreData.h>
#import "KSHLikeDislike.h"

extern const struct KSHStarAttributes {
} KSHStarAttributes;

extern const struct KSHStarRelationships {
	__unsafe_unretained NSString *article;
	__unsafe_unretained NSString *user;
} KSHStarRelationships;

extern const struct KSHStarFetchedProperties {
} KSHStarFetchedProperties;

@class KSHArticle;
@class KSHUser;


@interface KSHStarID : NSManagedObjectID {}
@end

@interface _KSHStar : KSHLikeDislike {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHStarID*)objectID;





@property (nonatomic, strong) KSHArticle *article;

//- (BOOL)validateArticle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) KSHUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHStar (CoreDataGeneratedAccessors)

@end

@interface _KSHStar (CoreDataGeneratedPrimitiveAccessors)



- (KSHArticle*)primitiveArticle;
- (void)setPrimitiveArticle:(KSHArticle*)value;



- (KSHUser*)primitiveUser;
- (void)setPrimitiveUser:(KSHUser*)value;


@end
