// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLikeDislike.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHLikeDislikeAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *deletedAt;
	__unsafe_unretained NSString *flag;
} KSHLikeDislikeAttributes;

extern const struct KSHLikeDislikeRelationships {
} KSHLikeDislikeRelationships;

extern const struct KSHLikeDislikeFetchedProperties {
} KSHLikeDislikeFetchedProperties;






@interface KSHLikeDislikeID : NSManagedObjectID {}
@end

@interface _KSHLikeDislike : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHLikeDislikeID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* deletedAt;



//- (BOOL)validateDeletedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* flag;



@property BOOL flagValue;
- (BOOL)flagValue;
- (void)setFlagValue:(BOOL)value_;

//- (BOOL)validateFlag:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHLikeDislike (CoreDataGeneratedAccessors)

@end

@interface _KSHLikeDislike (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveDeletedAt;
- (void)setPrimitiveDeletedAt:(NSDate*)value;




- (NSNumber*)primitiveFlag;
- (void)setPrimitiveFlag:(NSNumber*)value;

- (BOOL)primitiveFlagValue;
- (void)setPrimitiveFlagValue:(BOOL)value_;




@end
