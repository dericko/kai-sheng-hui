// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTask.h instead.

#import <CoreData/CoreData.h>
#import "KSHFetchable.h"

extern const struct KSHTaskAttributes {
	__unsafe_unretained NSString *endDate;
	__unsafe_unretained NSString *fetchableType;
	__unsafe_unretained NSString *list;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *paid;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *statusTime;
	__unsafe_unretained NSString *timezone;
} KSHTaskAttributes;

extern const struct KSHTaskRelationships {
	__unsafe_unretained NSString *ofProject;
} KSHTaskRelationships;

extern const struct KSHTaskFetchedProperties {
} KSHTaskFetchedProperties;

@class KSHProject;












@interface KSHTaskID : NSManagedObjectID {}
@end

@interface _KSHTask : KSHFetchable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHTaskID*)objectID;





@property (nonatomic, strong) NSDate* endDate;



//- (BOOL)validateEndDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fetchableType;



@property int16_t fetchableTypeValue;
- (int16_t)fetchableTypeValue;
- (void)setFetchableTypeValue:(int16_t)value_;

//- (BOOL)validateFetchableType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* list;



@property int32_t listValue;
- (int32_t)listValue;
- (void)setListValue:(int32_t)value_;

//- (BOOL)validateList:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* notes;



//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* paid;



@property BOOL paidValue;
- (BOOL)paidValue;
- (void)setPaidValue:(BOOL)value_;

//- (BOOL)validatePaid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startDate;



//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* status;



@property int16_t statusValue;
- (int16_t)statusValue;
- (void)setStatusValue:(int16_t)value_;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* statusTime;



//- (BOOL)validateStatusTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* timezone;



@property int16_t timezoneValue;
- (int16_t)timezoneValue;
- (void)setTimezoneValue:(int16_t)value_;

//- (BOOL)validateTimezone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHProject *ofProject;

//- (BOOL)validateOfProject:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHTask (CoreDataGeneratedAccessors)

@end

@interface _KSHTask (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndDate;
- (void)setPrimitiveEndDate:(NSDate*)value;




- (NSNumber*)primitiveFetchableType;
- (void)setPrimitiveFetchableType:(NSNumber*)value;

- (int16_t)primitiveFetchableTypeValue;
- (void)setPrimitiveFetchableTypeValue:(int16_t)value_;




- (NSNumber*)primitiveList;
- (void)setPrimitiveList:(NSNumber*)value;

- (int32_t)primitiveListValue;
- (void)setPrimitiveListValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;




- (NSNumber*)primitivePaid;
- (void)setPrimitivePaid:(NSNumber*)value;

- (BOOL)primitivePaidValue;
- (void)setPrimitivePaidValue:(BOOL)value_;




- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;




- (NSNumber*)primitiveStatus;
- (void)setPrimitiveStatus:(NSNumber*)value;

- (int16_t)primitiveStatusValue;
- (void)setPrimitiveStatusValue:(int16_t)value_;




- (NSDate*)primitiveStatusTime;
- (void)setPrimitiveStatusTime:(NSDate*)value;




- (NSNumber*)primitiveTimezone;
- (void)setPrimitiveTimezone:(NSNumber*)value;

- (int16_t)primitiveTimezoneValue;
- (void)setPrimitiveTimezoneValue:(int16_t)value_;





- (KSHProject*)primitiveOfProject;
- (void)setPrimitiveOfProject:(KSHProject*)value;


@end
