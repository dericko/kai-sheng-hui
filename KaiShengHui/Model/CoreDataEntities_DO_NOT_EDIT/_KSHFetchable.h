// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFetchable.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHFetchableAttributes {
	__unsafe_unretained NSString *createDate;
	__unsafe_unretained NSString *entityID;
	__unsafe_unretained NSString *updateDate;
} KSHFetchableAttributes;

extern const struct KSHFetchableRelationships {
} KSHFetchableRelationships;

extern const struct KSHFetchableFetchedProperties {
} KSHFetchableFetchedProperties;






@interface KSHFetchableID : NSManagedObjectID {}
@end

@interface _KSHFetchable : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHFetchableID*)objectID;





@property (nonatomic, strong) NSDate* createDate;



//- (BOOL)validateCreateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* entityID;



@property int32_t entityIDValue;
- (int32_t)entityIDValue;
- (void)setEntityIDValue:(int32_t)value_;

//- (BOOL)validateEntityID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateDate;



//- (BOOL)validateUpdateDate:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHFetchable (CoreDataGeneratedAccessors)

@end

@interface _KSHFetchable (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreateDate;
- (void)setPrimitiveCreateDate:(NSDate*)value;




- (NSNumber*)primitiveEntityID;
- (void)setPrimitiveEntityID:(NSNumber*)value;

- (int32_t)primitiveEntityIDValue;
- (void)setPrimitiveEntityIDValue:(int32_t)value_;




- (NSDate*)primitiveUpdateDate;
- (void)setPrimitiveUpdateDate:(NSDate*)value;




@end
