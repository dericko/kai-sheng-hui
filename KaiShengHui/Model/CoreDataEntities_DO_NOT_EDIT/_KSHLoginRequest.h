// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLoginRequest.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHLoginRequestAttributes {
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *password;
	__unsafe_unretained NSString *sessionID;
} KSHLoginRequestAttributes;

extern const struct KSHLoginRequestRelationships {
} KSHLoginRequestRelationships;

extern const struct KSHLoginRequestFetchedProperties {
} KSHLoginRequestFetchedProperties;






@interface KSHLoginRequestID : NSManagedObjectID {}
@end

@interface _KSHLoginRequest : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHLoginRequestID*)objectID;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* password;



//- (BOOL)validatePassword:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sessionID;



@property int32_t sessionIDValue;
- (int32_t)sessionIDValue;
- (void)setSessionIDValue:(int32_t)value_;

//- (BOOL)validateSessionID:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHLoginRequest (CoreDataGeneratedAccessors)

@end

@interface _KSHLoginRequest (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitivePassword;
- (void)setPrimitivePassword:(NSString*)value;




- (NSNumber*)primitiveSessionID;
- (void)setPrimitiveSessionID:(NSNumber*)value;

- (int32_t)primitiveSessionIDValue;
- (void)setPrimitiveSessionIDValue:(int32_t)value_;




@end
