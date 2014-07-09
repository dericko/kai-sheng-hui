// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHDislike.h instead.

#import <CoreData/CoreData.h>
#import "KSHLikeDislike.h"

extern const struct KSHDislikeAttributes {
	__unsafe_unretained NSString *flag;
} KSHDislikeAttributes;

extern const struct KSHDislikeRelationships {
	__unsafe_unretained NSString *article;
	__unsafe_unretained NSString *tag;
	__unsafe_unretained NSString *user;
} KSHDislikeRelationships;

extern const struct KSHDislikeFetchedProperties {
} KSHDislikeFetchedProperties;

@class KSHArticle;
@class KSHTag;
@class KSHUser;



@interface KSHDislikeID : NSManagedObjectID {}
@end

@interface _KSHDislike : KSHLikeDislike {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHDislikeID*)objectID;





@property (nonatomic, strong) NSNumber* flag;



@property BOOL flagValue;
- (BOOL)flagValue;
- (void)setFlagValue:(BOOL)value_;

//- (BOOL)validateFlag:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHArticle *article;

//- (BOOL)validateArticle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) KSHTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) KSHUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHDislike (CoreDataGeneratedAccessors)

@end

@interface _KSHDislike (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveFlag;
- (void)setPrimitiveFlag:(NSNumber*)value;

- (BOOL)primitiveFlagValue;
- (void)setPrimitiveFlagValue:(BOOL)value_;





- (KSHArticle*)primitiveArticle;
- (void)setPrimitiveArticle:(KSHArticle*)value;



- (KSHTag*)primitiveTag;
- (void)setPrimitiveTag:(KSHTag*)value;



- (KSHUser*)primitiveUser;
- (void)setPrimitiveUser:(KSHUser*)value;


@end
