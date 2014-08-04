// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFeedback.h instead.

#import <CoreData/CoreData.h>
#import "KSHFetchable.h"

extern const struct KSHFeedbackAttributes {
	__unsafe_unretained NSString *comment;
	__unsafe_unretained NSString *paymentScore;
	__unsafe_unretained NSString *qualityScore;
	__unsafe_unretained NSString *serviceScore;
	__unsafe_unretained NSString *willing;
} KSHFeedbackAttributes;

extern const struct KSHFeedbackRelationships {
	__unsafe_unretained NSString *ofProject;
} KSHFeedbackRelationships;

extern const struct KSHFeedbackFetchedProperties {
} KSHFeedbackFetchedProperties;

@class KSHProject;







@interface KSHFeedbackID : NSManagedObjectID {}
@end

@interface _KSHFeedback : KSHFetchable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHFeedbackID*)objectID;





@property (nonatomic, strong) NSString* comment;



//- (BOOL)validateComment:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* paymentScore;



@property int16_t paymentScoreValue;
- (int16_t)paymentScoreValue;
- (void)setPaymentScoreValue:(int16_t)value_;

//- (BOOL)validatePaymentScore:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* qualityScore;



@property int16_t qualityScoreValue;
- (int16_t)qualityScoreValue;
- (void)setQualityScoreValue:(int16_t)value_;

//- (BOOL)validateQualityScore:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* serviceScore;



@property int16_t serviceScoreValue;
- (int16_t)serviceScoreValue;
- (void)setServiceScoreValue:(int16_t)value_;

//- (BOOL)validateServiceScore:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* willing;



@property BOOL willingValue;
- (BOOL)willingValue;
- (void)setWillingValue:(BOOL)value_;

//- (BOOL)validateWilling:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) KSHProject *ofProject;

//- (BOOL)validateOfProject:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHFeedback (CoreDataGeneratedAccessors)

@end

@interface _KSHFeedback (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveComment;
- (void)setPrimitiveComment:(NSString*)value;




- (NSNumber*)primitivePaymentScore;
- (void)setPrimitivePaymentScore:(NSNumber*)value;

- (int16_t)primitivePaymentScoreValue;
- (void)setPrimitivePaymentScoreValue:(int16_t)value_;




- (NSNumber*)primitiveQualityScore;
- (void)setPrimitiveQualityScore:(NSNumber*)value;

- (int16_t)primitiveQualityScoreValue;
- (void)setPrimitiveQualityScoreValue:(int16_t)value_;




- (NSNumber*)primitiveServiceScore;
- (void)setPrimitiveServiceScore:(NSNumber*)value;

- (int16_t)primitiveServiceScoreValue;
- (void)setPrimitiveServiceScoreValue:(int16_t)value_;




- (NSNumber*)primitiveWilling;
- (void)setPrimitiveWilling:(NSNumber*)value;

- (BOOL)primitiveWillingValue;
- (void)setPrimitiveWillingValue:(BOOL)value_;





- (KSHProject*)primitiveOfProject;
- (void)setPrimitiveOfProject:(KSHProject*)value;


@end
