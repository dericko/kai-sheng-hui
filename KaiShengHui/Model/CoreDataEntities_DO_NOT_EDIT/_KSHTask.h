// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTask.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHTaskAttributes {
	__unsafe_unretained NSString *createTime;
	__unsafe_unretained NSString *endTime;
	__unsafe_unretained NSString *listID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *paid;
	__unsafe_unretained NSString *startTime;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *statusTime;
	__unsafe_unretained NSString *taskID;
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

@interface _KSHTask : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHTaskID*)objectID;





@property (nonatomic, strong) NSDate* createTime;



//- (BOOL)validateCreateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* endTime;



//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* listID;



@property int32_t listIDValue;
- (int32_t)listIDValue;
- (void)setListIDValue:(int32_t)value_;

//- (BOOL)validateListID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* notes;



//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* paid;



@property BOOL paidValue;
- (BOOL)paidValue;
- (void)setPaidValue:(BOOL)value_;

//- (BOOL)validatePaid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* status;



@property int16_t statusValue;
- (int16_t)statusValue;
- (void)setStatusValue:(int16_t)value_;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* statusTime;



//- (BOOL)validateStatusTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* taskID;



@property int32_t taskIDValue;
- (int32_t)taskIDValue;
- (void)setTaskIDValue:(int32_t)value_;

//- (BOOL)validateTaskID:(id*)value_ error:(NSError**)error_;





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


- (NSDate*)primitiveCreateTime;
- (void)setPrimitiveCreateTime:(NSDate*)value;




- (NSDate*)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate*)value;




- (NSNumber*)primitiveListID;
- (void)setPrimitiveListID:(NSNumber*)value;

- (int32_t)primitiveListIDValue;
- (void)setPrimitiveListIDValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;




- (NSNumber*)primitivePaid;
- (void)setPrimitivePaid:(NSNumber*)value;

- (BOOL)primitivePaidValue;
- (void)setPrimitivePaidValue:(BOOL)value_;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;




- (NSNumber*)primitiveStatus;
- (void)setPrimitiveStatus:(NSNumber*)value;

- (int16_t)primitiveStatusValue;
- (void)setPrimitiveStatusValue:(int16_t)value_;




- (NSDate*)primitiveStatusTime;
- (void)setPrimitiveStatusTime:(NSDate*)value;




- (NSNumber*)primitiveTaskID;
- (void)setPrimitiveTaskID:(NSNumber*)value;

- (int32_t)primitiveTaskIDValue;
- (void)setPrimitiveTaskIDValue:(int32_t)value_;




- (NSNumber*)primitiveTimezone;
- (void)setPrimitiveTimezone:(NSNumber*)value;

- (int16_t)primitiveTimezoneValue;
- (void)setPrimitiveTimezoneValue:(int16_t)value_;





- (KSHProject*)primitiveOfProject;
- (void)setPrimitiveOfProject:(KSHProject*)value;


@end
