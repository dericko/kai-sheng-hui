// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProfile.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHProfileAttributes {
	__unsafe_unretained NSString *company;
	__unsafe_unretained NSString *createTime;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *mobile;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *nickname;
	__unsafe_unretained NSString *position;
} KSHProfileAttributes;

extern const struct KSHProfileRelationships {
	__unsafe_unretained NSString *user;
} KSHProfileRelationships;

extern const struct KSHProfileFetchedProperties {
} KSHProfileFetchedProperties;

@class KSHUser;











@interface KSHProfileID : NSManagedObjectID {}
@end

@interface _KSHProfile : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProfileID*)objectID;





@property (nonatomic, strong) NSString* company;



//- (BOOL)validateCompany:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createTime;



//- (BOOL)validateCreateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) KSHUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHProfile (CoreDataGeneratedAccessors)

@end

@interface _KSHProfile (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCompany;
- (void)setPrimitiveCompany:(NSString*)value;




- (NSDate*)primitiveCreateTime;
- (void)setPrimitiveCreateTime:(NSDate*)value;




- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




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





- (KSHUser*)primitiveUser;
- (void)setPrimitiveUser:(KSHUser*)value;


@end
