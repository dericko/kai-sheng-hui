// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProject.h instead.

#import <CoreData/CoreData.h>
#import "KSHFetchable.h"

extern const struct KSHProjectAttributes {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *currencyUnit;
	__unsafe_unretained NSString *endDate;
	__unsafe_unretained NSString *fetchableType;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *priority;
	__unsafe_unretained NSString *projectDescription;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *statusTime;
	__unsafe_unretained NSString *timeframe;
	__unsafe_unretained NSString *type;
} KSHProjectAttributes;

extern const struct KSHProjectRelationships {
	__unsafe_unretained NSString *hasFeedback;
	__unsafe_unretained NSString *hasTask;
	__unsafe_unretained NSString *ofUser;
} KSHProjectRelationships;

extern const struct KSHProjectFetchedProperties {
} KSHProjectFetchedProperties;

@class KSHFeedback;
@class KSHTask;
@class KSHUser;
















@interface KSHProjectID : NSManagedObjectID {}
@end

@interface _KSHProject : KSHFetchable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProjectID*)objectID;





@property (nonatomic, strong) NSNumber* category;



@property int16_t categoryValue;
- (int16_t)categoryValue;
- (void)setCategoryValue:(int16_t)value_;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* currencyUnit;



//- (BOOL)validateCurrencyUnit:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* endDate;



//- (BOOL)validateEndDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fetchableType;



@property int16_t fetchableTypeValue;
- (int16_t)fetchableTypeValue;
- (void)setFetchableTypeValue:(int16_t)value_;

//- (BOOL)validateFetchableType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industry;



@property int16_t industryValue;
- (int16_t)industryValue;
- (void)setIndustryValue:(int16_t)value_;

//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSDate* startDate;



//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* status;



@property int16_t statusValue;
- (int16_t)statusValue;
- (void)setStatusValue:(int16_t)value_;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* statusTime;



//- (BOOL)validateStatusTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* timeframe;



@property int16_t timeframeValue;
- (int16_t)timeframeValue;
- (void)setTimeframeValue:(int16_t)value_;

//- (BOOL)validateTimeframe:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int16_t typeValue;
- (int16_t)typeValue;
- (void)setTypeValue:(int16_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHFeedback *hasFeedback;

//- (BOOL)validateHasFeedback:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *hasTask;

- (NSMutableSet*)hasTaskSet;




@property (nonatomic, strong) KSHUser *ofUser;

//- (BOOL)validateOfUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHProject (CoreDataGeneratedAccessors)

- (void)addHasTask:(NSSet*)value_;
- (void)removeHasTask:(NSSet*)value_;
- (void)addHasTaskObject:(KSHTask*)value_;
- (void)removeHasTaskObject:(KSHTask*)value_;

@end

@interface _KSHProject (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCategory;
- (void)setPrimitiveCategory:(NSNumber*)value;

- (int16_t)primitiveCategoryValue;
- (void)setPrimitiveCategoryValue:(int16_t)value_;




- (NSString*)primitiveCurrencyUnit;
- (void)setPrimitiveCurrencyUnit:(NSString*)value;




- (NSDate*)primitiveEndDate;
- (void)setPrimitiveEndDate:(NSDate*)value;




- (NSNumber*)primitiveFetchableType;
- (void)setPrimitiveFetchableType:(NSNumber*)value;

- (int16_t)primitiveFetchableTypeValue;
- (void)setPrimitiveFetchableTypeValue:(int16_t)value_;




- (NSNumber*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSNumber*)value;

- (int16_t)primitiveIndustryValue;
- (void)setPrimitiveIndustryValue:(int16_t)value_;




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




- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;




- (NSNumber*)primitiveStatus;
- (void)setPrimitiveStatus:(NSNumber*)value;

- (int16_t)primitiveStatusValue;
- (void)setPrimitiveStatusValue:(int16_t)value_;




- (NSDate*)primitiveStatusTime;
- (void)setPrimitiveStatusTime:(NSDate*)value;




- (NSNumber*)primitiveTimeframe;
- (void)setPrimitiveTimeframe:(NSNumber*)value;

- (int16_t)primitiveTimeframeValue;
- (void)setPrimitiveTimeframeValue:(int16_t)value_;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int16_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int16_t)value_;





- (KSHFeedback*)primitiveHasFeedback;
- (void)setPrimitiveHasFeedback:(KSHFeedback*)value;



- (NSMutableSet*)primitiveHasTask;
- (void)setPrimitiveHasTask:(NSMutableSet*)value;



- (KSHUser*)primitiveOfUser;
- (void)setPrimitiveOfUser:(KSHUser*)value;


@end
