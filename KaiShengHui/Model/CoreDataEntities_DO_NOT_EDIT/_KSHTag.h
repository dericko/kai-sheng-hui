// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTag.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHTagAttributes {
	__unsafe_unretained NSString *tag;
	__unsafe_unretained NSString *tagID;
} KSHTagAttributes;

extern const struct KSHTagRelationships {
	__unsafe_unretained NSString *disliked;
	__unsafe_unretained NSString *liked;
	__unsafe_unretained NSString *ofArticle;
} KSHTagRelationships;

extern const struct KSHTagFetchedProperties {
} KSHTagFetchedProperties;

@class KSHDislike;
@class KSHLike;
@class KSHArticle;




@interface KSHTagID : NSManagedObjectID {}
@end

@interface _KSHTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHTagID*)objectID;





@property (nonatomic, strong) NSString* tag;



//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* tagID;



@property int32_t tagIDValue;
- (int32_t)tagIDValue;
- (void)setTagIDValue:(int32_t)value_;

//- (BOOL)validateTagID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *disliked;

- (NSMutableSet*)dislikedSet;




@property (nonatomic, strong) NSSet *liked;

- (NSMutableSet*)likedSet;




@property (nonatomic, strong) KSHArticle *ofArticle;

//- (BOOL)validateOfArticle:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHTag (CoreDataGeneratedAccessors)

- (void)addDisliked:(NSSet*)value_;
- (void)removeDisliked:(NSSet*)value_;
- (void)addDislikedObject:(KSHDislike*)value_;
- (void)removeDislikedObject:(KSHDislike*)value_;

- (void)addLiked:(NSSet*)value_;
- (void)removeLiked:(NSSet*)value_;
- (void)addLikedObject:(KSHLike*)value_;
- (void)removeLikedObject:(KSHLike*)value_;

@end

@interface _KSHTag (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveTag;
- (void)setPrimitiveTag:(NSString*)value;




- (NSNumber*)primitiveTagID;
- (void)setPrimitiveTagID:(NSNumber*)value;

- (int32_t)primitiveTagIDValue;
- (void)setPrimitiveTagIDValue:(int32_t)value_;





- (NSMutableSet*)primitiveDisliked;
- (void)setPrimitiveDisliked:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLiked;
- (void)setPrimitiveLiked:(NSMutableSet*)value;



- (KSHArticle*)primitiveOfArticle;
- (void)setPrimitiveOfArticle:(KSHArticle*)value;


@end
