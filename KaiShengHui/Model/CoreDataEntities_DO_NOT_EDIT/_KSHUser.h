// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHUserAttributes {
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *function;
	__unsafe_unretained NSString *functionID;
	__unsafe_unretained NSString *imgFile;
	__unsafe_unretained NSString *imgURLString;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *industryID;
	__unsafe_unretained NSString *lastLoginDate;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *signupDate;
	__unsafe_unretained NSString *userID;
	__unsafe_unretained NSString *username;
} KSHUserAttributes;

extern const struct KSHUserRelationships {
	__unsafe_unretained NSString *dislikes;
	__unsafe_unretained NSString *likes;
} KSHUserRelationships;

extern const struct KSHUserFetchedProperties {
} KSHUserFetchedProperties;

@class KSHDislike;
@class KSHLike;















@interface KSHUserID : NSManagedObjectID {}
@end

@interface _KSHUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHUserID*)objectID;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* function;



//- (BOOL)validateFunction:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* functionID;



@property int32_t functionIDValue;
- (int32_t)functionIDValue;
- (void)setFunctionIDValue:(int32_t)value_;

//- (BOOL)validateFunctionID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* imgFile;



//- (BOOL)validateImgFile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imgURLString;



//- (BOOL)validateImgURLString:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* industry;



//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industryID;



@property int16_t industryIDValue;
- (int16_t)industryIDValue;
- (void)setIndustryIDValue:(int16_t)value_;

//- (BOOL)validateIndustryID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* lastLoginDate;



//- (BOOL)validateLastLoginDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* signupDate;



//- (BOOL)validateSignupDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userID;



@property int32_t userIDValue;
- (int32_t)userIDValue;
- (void)setUserIDValue:(int32_t)value_;

//- (BOOL)validateUserID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *dislikes;

- (NSMutableSet*)dislikesSet;




@property (nonatomic, strong) NSSet *likes;

- (NSMutableSet*)likesSet;





@end

@interface _KSHUser (CoreDataGeneratedAccessors)

- (void)addDislikes:(NSSet*)value_;
- (void)removeDislikes:(NSSet*)value_;
- (void)addDislikesObject:(KSHDislike*)value_;
- (void)removeDislikesObject:(KSHDislike*)value_;

- (void)addLikes:(NSSet*)value_;
- (void)removeLikes:(NSSet*)value_;
- (void)addLikesObject:(KSHLike*)value_;
- (void)removeLikesObject:(KSHLike*)value_;

@end

@interface _KSHUser (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveFunction;
- (void)setPrimitiveFunction:(NSString*)value;




- (NSNumber*)primitiveFunctionID;
- (void)setPrimitiveFunctionID:(NSNumber*)value;

- (int32_t)primitiveFunctionIDValue;
- (void)setPrimitiveFunctionIDValue:(int32_t)value_;




- (NSData*)primitiveImgFile;
- (void)setPrimitiveImgFile:(NSData*)value;




- (NSString*)primitiveImgURLString;
- (void)setPrimitiveImgURLString:(NSString*)value;




- (NSString*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSString*)value;




- (NSNumber*)primitiveIndustryID;
- (void)setPrimitiveIndustryID:(NSNumber*)value;

- (int16_t)primitiveIndustryIDValue;
- (void)setPrimitiveIndustryIDValue:(int16_t)value_;




- (NSDate*)primitiveLastLoginDate;
- (void)setPrimitiveLastLoginDate:(NSDate*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSDate*)primitiveSignupDate;
- (void)setPrimitiveSignupDate:(NSDate*)value;




- (NSNumber*)primitiveUserID;
- (void)setPrimitiveUserID:(NSNumber*)value;

- (int32_t)primitiveUserIDValue;
- (void)setPrimitiveUserIDValue:(int32_t)value_;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;





- (NSMutableSet*)primitiveDislikes;
- (void)setPrimitiveDislikes:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLikes;
- (void)setPrimitiveLikes:(NSMutableSet*)value;


@end
