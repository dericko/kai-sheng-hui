// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHEvent.h instead.

#import <CoreData/CoreData.h>
#import "KSHPost.h"

extern const struct KSHEventAttributes {
	__unsafe_unretained NSString *chargeType;
	__unsafe_unretained NSString *contactEmail;
	__unsafe_unretained NSString *contactName;
	__unsafe_unretained NSString *contactTelephone;
	__unsafe_unretained NSString *endTime;
	__unsafe_unretained NSString *eventURLString;
	__unsafe_unretained NSString *memberPrice;
	__unsafe_unretained NSString *mustApply;
	__unsafe_unretained NSString *nonmemberPrice;
	__unsafe_unretained NSString *place;
	__unsafe_unretained NSString *region;
	__unsafe_unretained NSString *startTime;
	__unsafe_unretained NSString *type;
} KSHEventAttributes;

extern const struct KSHEventRelationships {
} KSHEventRelationships;

extern const struct KSHEventFetchedProperties {
} KSHEventFetchedProperties;
















@interface KSHEventID : NSManagedObjectID {}
@end

@interface _KSHEvent : KSHPost {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHEventID*)objectID;





@property (nonatomic, strong) NSNumber* chargeType;



@property int16_t chargeTypeValue;
- (int16_t)chargeTypeValue;
- (void)setChargeTypeValue:(int16_t)value_;

//- (BOOL)validateChargeType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* contactEmail;



//- (BOOL)validateContactEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* contactName;



//- (BOOL)validateContactName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* contactTelephone;



//- (BOOL)validateContactTelephone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* endTime;



//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* eventURLString;



//- (BOOL)validateEventURLString:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* memberPrice;



//- (BOOL)validateMemberPrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* mustApply;



@property BOOL mustApplyValue;
- (BOOL)mustApplyValue;
- (void)setMustApplyValue:(BOOL)value_;

//- (BOOL)validateMustApply:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* nonmemberPrice;



//- (BOOL)validateNonmemberPrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* place;



//- (BOOL)validatePlace:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* region;



//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int16_t typeValue;
- (int16_t)typeValue;
- (void)setTypeValue:(int16_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHEvent (CoreDataGeneratedAccessors)

@end

@interface _KSHEvent (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveChargeType;
- (void)setPrimitiveChargeType:(NSNumber*)value;

- (int16_t)primitiveChargeTypeValue;
- (void)setPrimitiveChargeTypeValue:(int16_t)value_;




- (NSString*)primitiveContactEmail;
- (void)setPrimitiveContactEmail:(NSString*)value;




- (NSString*)primitiveContactName;
- (void)setPrimitiveContactName:(NSString*)value;




- (NSString*)primitiveContactTelephone;
- (void)setPrimitiveContactTelephone:(NSString*)value;




- (NSString*)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSString*)value;




- (NSString*)primitiveEventURLString;
- (void)setPrimitiveEventURLString:(NSString*)value;




- (NSDecimalNumber*)primitiveMemberPrice;
- (void)setPrimitiveMemberPrice:(NSDecimalNumber*)value;




- (NSNumber*)primitiveMustApply;
- (void)setPrimitiveMustApply:(NSNumber*)value;

- (BOOL)primitiveMustApplyValue;
- (void)setPrimitiveMustApplyValue:(BOOL)value_;




- (NSDecimalNumber*)primitiveNonmemberPrice;
- (void)setPrimitiveNonmemberPrice:(NSDecimalNumber*)value;




- (NSString*)primitivePlace;
- (void)setPrimitivePlace:(NSString*)value;




- (NSString*)primitiveRegion;
- (void)setPrimitiveRegion:(NSString*)value;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int16_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int16_t)value_;




@end
