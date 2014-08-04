// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProjectOpportunity.h instead.

#import <CoreData/CoreData.h>
#import "KSHFavoritable.h"

extern const struct KSHProjectOpportunityAttributes {
	__unsafe_unretained NSString *contacts;
	__unsafe_unretained NSString *deadlineDate;
	__unsafe_unretained NSString *fetchableType;
	__unsafe_unretained NSString *idealBackground;
	__unsafe_unretained NSString *referenceContent;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *urlString;
} KSHProjectOpportunityAttributes;

extern const struct KSHProjectOpportunityRelationships {
} KSHProjectOpportunityRelationships;

extern const struct KSHProjectOpportunityFetchedProperties {
} KSHProjectOpportunityFetchedProperties;










@interface KSHProjectOpportunityID : NSManagedObjectID {}
@end

@interface _KSHProjectOpportunity : KSHFavoritable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProjectOpportunityID*)objectID;





@property (nonatomic, strong) NSString* contacts;



//- (BOOL)validateContacts:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* deadlineDate;



//- (BOOL)validateDeadlineDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fetchableType;



@property int16_t fetchableTypeValue;
- (int16_t)fetchableTypeValue;
- (void)setFetchableTypeValue:(int16_t)value_;

//- (BOOL)validateFetchableType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* idealBackground;



//- (BOOL)validateIdealBackground:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* referenceContent;



//- (BOOL)validateReferenceContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* urlString;



//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHProjectOpportunity (CoreDataGeneratedAccessors)

@end

@interface _KSHProjectOpportunity (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContacts;
- (void)setPrimitiveContacts:(NSString*)value;




- (NSDate*)primitiveDeadlineDate;
- (void)setPrimitiveDeadlineDate:(NSDate*)value;




- (NSNumber*)primitiveFetchableType;
- (void)setPrimitiveFetchableType:(NSNumber*)value;

- (int16_t)primitiveFetchableTypeValue;
- (void)setPrimitiveFetchableTypeValue:(int16_t)value_;




- (NSString*)primitiveIdealBackground;
- (void)setPrimitiveIdealBackground:(NSString*)value;




- (NSString*)primitiveReferenceContent;
- (void)setPrimitiveReferenceContent:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;




@end
