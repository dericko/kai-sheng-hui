// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultant.h instead.

#import <CoreData/CoreData.h>
#import "KSHUser.h"

extern const struct KSHConsultantAttributes {
	__unsafe_unretained NSString *birthday;
	__unsafe_unretained NSString *education;
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *profile;
	__unsafe_unretained NSString *residence;
	__unsafe_unretained NSString *specialty;
} KSHConsultantAttributes;

extern const struct KSHConsultantRelationships {
	__unsafe_unretained NSString *hasProject;
	__unsafe_unretained NSString *hasProjectOpportunity;
} KSHConsultantRelationships;

extern const struct KSHConsultantFetchedProperties {
} KSHConsultantFetchedProperties;

@class KSHProject;
@class KSHProjectOpportunity;









@interface KSHConsultantID : NSManagedObjectID {}
@end

@interface _KSHConsultant : KSHUser {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHConsultantID*)objectID;





@property (nonatomic, strong) NSString* birthday;



//- (BOOL)validateBirthday:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* education;



@property int16_t educationValue;
- (int16_t)educationValue;
- (void)setEducationValue:(int16_t)value_;

//- (BOOL)validateEducation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* gender;



@property int16_t genderValue;
- (int16_t)genderValue;
- (void)setGenderValue:(int16_t)value_;

//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industry;



@property int32_t industryValue;
- (int32_t)industryValue;
- (void)setIndustryValue:(int32_t)value_;

//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* profile;



//- (BOOL)validateProfile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* residence;



//- (BOOL)validateResidence:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* specialty;



//- (BOOL)validateSpecialty:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *hasProject;

- (NSMutableSet*)hasProjectSet;




@property (nonatomic, strong) NSSet *hasProjectOpportunity;

- (NSMutableSet*)hasProjectOpportunitySet;





@end

@interface _KSHConsultant (CoreDataGeneratedAccessors)

- (void)addHasProject:(NSSet*)value_;
- (void)removeHasProject:(NSSet*)value_;
- (void)addHasProjectObject:(KSHProject*)value_;
- (void)removeHasProjectObject:(KSHProject*)value_;

- (void)addHasProjectOpportunity:(NSSet*)value_;
- (void)removeHasProjectOpportunity:(NSSet*)value_;
- (void)addHasProjectOpportunityObject:(KSHProjectOpportunity*)value_;
- (void)removeHasProjectOpportunityObject:(KSHProjectOpportunity*)value_;

@end

@interface _KSHConsultant (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBirthday;
- (void)setPrimitiveBirthday:(NSString*)value;




- (NSNumber*)primitiveEducation;
- (void)setPrimitiveEducation:(NSNumber*)value;

- (int16_t)primitiveEducationValue;
- (void)setPrimitiveEducationValue:(int16_t)value_;




- (NSNumber*)primitiveGender;
- (void)setPrimitiveGender:(NSNumber*)value;

- (int16_t)primitiveGenderValue;
- (void)setPrimitiveGenderValue:(int16_t)value_;




- (NSNumber*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSNumber*)value;

- (int32_t)primitiveIndustryValue;
- (void)setPrimitiveIndustryValue:(int32_t)value_;




- (NSString*)primitiveProfile;
- (void)setPrimitiveProfile:(NSString*)value;




- (NSString*)primitiveResidence;
- (void)setPrimitiveResidence:(NSString*)value;




- (NSString*)primitiveSpecialty;
- (void)setPrimitiveSpecialty:(NSString*)value;





- (NSMutableSet*)primitiveHasProject;
- (void)setPrimitiveHasProject:(NSMutableSet*)value;



- (NSMutableSet*)primitiveHasProjectOpportunity;
- (void)setPrimitiveHasProjectOpportunity:(NSMutableSet*)value;


@end
