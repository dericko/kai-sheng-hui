// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProject.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHProjectAttributes {
	__unsafe_unretained NSString *categoryID;
	__unsafe_unretained NSString *createTime;
	__unsafe_unretained NSString *currencyUnit;
	__unsafe_unretained NSString *endTime;
	__unsafe_unretained NSString *industryID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *priority;
	__unsafe_unretained NSString *projectDescription;
	__unsafe_unretained NSString *projectID;
	__unsafe_unretained NSString *startTime;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *statusTime;
	__unsafe_unretained NSString *timeframe;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *updateTime;
} KSHProjectAttributes;

extern const struct KSHProjectRelationships {
	__unsafe_unretained NSString *hasFeedback;
	__unsafe_unretained NSString *hasTask;
	__unsafe_unretained NSString *ofConsultant;
} KSHProjectRelationships;

extern const struct KSHProjectFetchedProperties {
} KSHProjectFetchedProperties;

@class KSHFeedback;
@class KSHTask;
@class KSHConsultant;


















@interface KSHProjectID : NSManagedObjectID {}
@end

@interface _KSHProject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProjectID*)objectID;





@property (nonatomic, strong) NSNumber* categoryID;



@property int16_t categoryIDValue;
- (int16_t)categoryIDValue;
- (void)setCategoryIDValue:(int16_t)value_;

//- (BOOL)validateCategoryID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createTime;



//- (BOOL)validateCreateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* currencyUnit;



//- (BOOL)validateCurrencyUnit:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* endTime;



//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industryID;



@property int32_t industryIDValue;
- (int32_t)industryIDValue;
- (void)setIndustryIDValue:(int32_t)value_;

//- (BOOL)validateIndustryID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* price;



@property int32_t priceValue;
- (int32_t)priceValue;
- (void)setPriceValue:(int32_t)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* priority;



@property int16_t priorityValue;
- (int16_t)priorityValue;
- (void)setPriorityValue:(int16_t)value_;

//- (BOOL)validatePriority:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* projectDescription;



//- (BOOL)validateProjectDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* projectID;



@property int32_t projectIDValue;
- (int32_t)projectIDValue;
- (void)setProjectIDValue:(int32_t)value_;

//- (BOOL)validateProjectID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* status;



@property int16_t statusValue;
- (int16_t)statusValue;
- (void)setStatusValue:(int16_t)value_;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* statusTime;



//- (BOOL)validateStatusTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* timeframe;



//- (BOOL)validateTimeframe:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int16_t typeValue;
- (int16_t)typeValue;
- (void)setTypeValue:(int16_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateTime;



//- (BOOL)validateUpdateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHFeedback *hasFeedback;

//- (BOOL)validateHasFeedback:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *hasTask;

- (NSMutableSet*)hasTaskSet;




@property (nonatomic, strong) KSHConsultant *ofConsultant;

//- (BOOL)validateOfConsultant:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHProject (CoreDataGeneratedAccessors)

- (void)addHasTask:(NSSet*)value_;
- (void)removeHasTask:(NSSet*)value_;
- (void)addHasTaskObject:(KSHTask*)value_;
- (void)removeHasTaskObject:(KSHTask*)value_;

@end

@interface _KSHProject (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCategoryID;
- (void)setPrimitiveCategoryID:(NSNumber*)value;

- (int16_t)primitiveCategoryIDValue;
- (void)setPrimitiveCategoryIDValue:(int16_t)value_;




- (NSDate*)primitiveCreateTime;
- (void)setPrimitiveCreateTime:(NSDate*)value;




- (NSString*)primitiveCurrencyUnit;
- (void)setPrimitiveCurrencyUnit:(NSString*)value;




- (NSDate*)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate*)value;




- (NSNumber*)primitiveIndustryID;
- (void)setPrimitiveIndustryID:(NSNumber*)value;

- (int32_t)primitiveIndustryIDValue;
- (void)setPrimitiveIndustryIDValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (int32_t)primitivePriceValue;
- (void)setPrimitivePriceValue:(int32_t)value_;




- (NSNumber*)primitivePriority;
- (void)setPrimitivePriority:(NSNumber*)value;

- (int16_t)primitivePriorityValue;
- (void)setPrimitivePriorityValue:(int16_t)value_;




- (NSString*)primitiveProjectDescription;
- (void)setPrimitiveProjectDescription:(NSString*)value;




- (NSNumber*)primitiveProjectID;
- (void)setPrimitiveProjectID:(NSNumber*)value;

- (int32_t)primitiveProjectIDValue;
- (void)setPrimitiveProjectIDValue:(int32_t)value_;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;




- (NSNumber*)primitiveStatus;
- (void)setPrimitiveStatus:(NSNumber*)value;

- (int16_t)primitiveStatusValue;
- (void)setPrimitiveStatusValue:(int16_t)value_;




- (NSDate*)primitiveStatusTime;
- (void)setPrimitiveStatusTime:(NSDate*)value;




- (NSString*)primitiveTimeframe;
- (void)setPrimitiveTimeframe:(NSString*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int16_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int16_t)value_;




- (NSDate*)primitiveUpdateTime;
- (void)setPrimitiveUpdateTime:(NSDate*)value;





- (KSHFeedback*)primitiveHasFeedback;
- (void)setPrimitiveHasFeedback:(KSHFeedback*)value;



- (NSMutableSet*)primitiveHasTask;
- (void)setPrimitiveHasTask:(NSMutableSet*)value;



- (KSHConsultant*)primitiveOfConsultant;
- (void)setPrimitiveOfConsultant:(KSHConsultant*)value;


@end
