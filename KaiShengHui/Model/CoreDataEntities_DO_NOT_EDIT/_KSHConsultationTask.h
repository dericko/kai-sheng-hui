// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultationTask.h instead.

#import <CoreData/CoreData.h>
#import "KSHTask.h"

extern const struct KSHConsultationTaskAttributes {
	__unsafe_unretained NSString *approved;
	__unsafe_unretained NSString *clientID;
	__unsafe_unretained NSString *contactID;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *interviewType;
	__unsafe_unretained NSString *positionID;
} KSHConsultationTaskAttributes;

extern const struct KSHConsultationTaskRelationships {
} KSHConsultationTaskRelationships;

extern const struct KSHConsultationTaskFetchedProperties {
} KSHConsultationTaskFetchedProperties;









@interface KSHConsultationTaskID : NSManagedObjectID {}
@end

@interface _KSHConsultationTask : KSHTask {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHConsultationTaskID*)objectID;





@property (nonatomic, strong) NSNumber* approved;



@property BOOL approvedValue;
- (BOOL)approvedValue;
- (void)setApprovedValue:(BOOL)value_;

//- (BOOL)validateApproved:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* clientID;



@property int32_t clientIDValue;
- (int32_t)clientIDValue;
- (void)setClientIDValue:(int32_t)value_;

//- (BOOL)validateClientID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* contactID;



@property int32_t contactIDValue;
- (int32_t)contactIDValue;
- (void)setContactIDValue:(int32_t)value_;

//- (BOOL)validateContactID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industry;



@property int32_t industryValue;
- (int32_t)industryValue;
- (void)setIndustryValue:(int32_t)value_;

//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* interviewType;



@property int16_t interviewTypeValue;
- (int16_t)interviewTypeValue;
- (void)setInterviewTypeValue:(int16_t)value_;

//- (BOOL)validateInterviewType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* positionID;



@property int32_t positionIDValue;
- (int32_t)positionIDValue;
- (void)setPositionIDValue:(int32_t)value_;

//- (BOOL)validatePositionID:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHConsultationTask (CoreDataGeneratedAccessors)

@end

@interface _KSHConsultationTask (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveApproved;
- (void)setPrimitiveApproved:(NSNumber*)value;

- (BOOL)primitiveApprovedValue;
- (void)setPrimitiveApprovedValue:(BOOL)value_;




- (NSNumber*)primitiveClientID;
- (void)setPrimitiveClientID:(NSNumber*)value;

- (int32_t)primitiveClientIDValue;
- (void)setPrimitiveClientIDValue:(int32_t)value_;




- (NSNumber*)primitiveContactID;
- (void)setPrimitiveContactID:(NSNumber*)value;

- (int32_t)primitiveContactIDValue;
- (void)setPrimitiveContactIDValue:(int32_t)value_;




- (NSNumber*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSNumber*)value;

- (int32_t)primitiveIndustryValue;
- (void)setPrimitiveIndustryValue:(int32_t)value_;




- (NSNumber*)primitiveInterviewType;
- (void)setPrimitiveInterviewType:(NSNumber*)value;

- (int16_t)primitiveInterviewTypeValue;
- (void)setPrimitiveInterviewTypeValue:(int16_t)value_;




- (NSNumber*)primitivePositionID;
- (void)setPrimitivePositionID:(NSNumber*)value;

- (int32_t)primitivePositionIDValue;
- (void)setPrimitivePositionIDValue:(int32_t)value_;




@end
