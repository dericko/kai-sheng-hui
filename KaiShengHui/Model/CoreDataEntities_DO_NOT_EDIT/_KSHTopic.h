// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTopic.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHTopicAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *topicID;
	__unsafe_unretained NSString *type;
} KSHTopicAttributes;

extern const struct KSHTopicRelationships {
	__unsafe_unretained NSString *dislikedBy;
	__unsafe_unretained NSString *likedBy;
	__unsafe_unretained NSString *ofArticle;
} KSHTopicRelationships;

extern const struct KSHTopicFetchedProperties {
} KSHTopicFetchedProperties;

@class KSHUser;
@class KSHUser;
@class KSHArticle;





@interface KSHTopicID : NSManagedObjectID {}
@end

@interface _KSHTopic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHTopicID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* topicID;



@property int32_t topicIDValue;
- (int32_t)topicIDValue;
- (void)setTopicIDValue:(int32_t)value_;

//- (BOOL)validateTopicID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int16_t typeValue;
- (int16_t)typeValue;
- (void)setTypeValue:(int16_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *dislikedBy;

- (NSMutableSet*)dislikedBySet;




@property (nonatomic, strong) NSSet *likedBy;

- (NSMutableSet*)likedBySet;




@property (nonatomic, strong) KSHArticle *ofArticle;

//- (BOOL)validateOfArticle:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHTopic (CoreDataGeneratedAccessors)

- (void)addDislikedBy:(NSSet*)value_;
- (void)removeDislikedBy:(NSSet*)value_;
- (void)addDislikedByObject:(KSHUser*)value_;
- (void)removeDislikedByObject:(KSHUser*)value_;

- (void)addLikedBy:(NSSet*)value_;
- (void)removeLikedBy:(NSSet*)value_;
- (void)addLikedByObject:(KSHUser*)value_;
- (void)removeLikedByObject:(KSHUser*)value_;

@end

@interface _KSHTopic (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveTopicID;
- (void)setPrimitiveTopicID:(NSNumber*)value;

- (int32_t)primitiveTopicIDValue;
- (void)setPrimitiveTopicIDValue:(int32_t)value_;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int16_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int16_t)value_;





- (NSMutableSet*)primitiveDislikedBy;
- (void)setPrimitiveDislikedBy:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLikedBy;
- (void)setPrimitiveLikedBy:(NSMutableSet*)value;



- (KSHArticle*)primitiveOfArticle;
- (void)setPrimitiveOfArticle:(KSHArticle*)value;


@end
