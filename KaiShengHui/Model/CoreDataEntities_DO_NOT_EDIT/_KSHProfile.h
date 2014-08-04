// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProfile.h instead.

#import <CoreData/CoreData.h>
#import "KSHFetchable.h"

extern const struct KSHProfileAttributes {
	__unsafe_unretained NSString *birthday;
	__unsafe_unretained NSString *company;
	__unsafe_unretained NSString *education;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *mobile;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *nickname;
	__unsafe_unretained NSString *position;
	__unsafe_unretained NSString *profile;
	__unsafe_unretained NSString *residence;
	__unsafe_unretained NSString *specialty;
} KSHProfileAttributes;

extern const struct KSHProfileRelationships {
	__unsafe_unretained NSString *user;
} KSHProfileRelationships;

extern const struct KSHProfileFetchedProperties {
} KSHProfileFetchedProperties;

@class KSHUser;
















@interface KSHProfileID : NSManagedObjectID {}
@end

@interface _KSHProfile : KSHFetchable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProfileID*)objectID;





@property (nonatomic, strong) NSString* birthday;



//- (BOOL)validateBirthday:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* company;



//- (BOOL)validateCompany:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* education;



@property int16_t educationValue;
- (int16_t)educationValue;
- (void)setEducationValue:(int16_t)value_;

//- (BOOL)validateEducation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* gender;



@property int16_t genderValue;
- (int16_t)genderValue;
- (void)setGenderValue:(int16_t)value_;

//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industry;



@property int16_t industryValue;
- (int16_t)industryValue;
- (void)setIndustryValue:(int16_t)value_;

//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mobile;



//- (BOOL)validateMobile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* nickname;



//- (BOOL)validateNickname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* position;



//- (BOOL)validatePosition:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* profile;



//- (BOOL)validateProfile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* residence;



//- (BOOL)validateResidence:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* specialty;



//- (BOOL)validateSpecialty:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHProfile (CoreDataGeneratedAccessors)

@end

@interface _KSHProfile (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBirthday;
- (void)setPrimitiveBirthday:(NSString*)value;




- (NSString*)primitiveCompany;
- (void)setPrimitiveCompany:(NSString*)value;




- (NSNumber*)primitiveEducation;
- (void)setPrimitiveEducation:(NSNumber*)value;

- (int16_t)primitiveEducationValue;
- (void)setPrimitiveEducationValue:(int16_t)value_;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSNumber*)primitiveGender;
- (void)setPrimitiveGender:(NSNumber*)value;

- (int16_t)primitiveGenderValue;
- (void)setPrimitiveGenderValue:(int16_t)value_;




- (NSNumber*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSNumber*)value;

- (int16_t)primitiveIndustryValue;
- (void)setPrimitiveIndustryValue:(int16_t)value_;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveMobile;
- (void)setPrimitiveMobile:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveNickname;
- (void)setPrimitiveNickname:(NSString*)value;




- (NSString*)primitivePosition;
- (void)setPrimitivePosition:(NSString*)value;




- (NSString*)primitiveProfile;
- (void)setPrimitiveProfile:(NSString*)value;




- (NSString*)primitiveResidence;
- (void)setPrimitiveResidence:(NSString*)value;




- (NSString*)primitiveSpecialty;
- (void)setPrimitiveSpecialty:(NSString*)value;





- (KSHUser*)primitiveUser;
- (void)setPrimitiveUser:(KSHUser*)value;


@end
