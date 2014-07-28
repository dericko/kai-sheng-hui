// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProjectOpportunity.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHProjectOpportunityAttributes {
	__unsafe_unretained NSString *contacts;
	__unsafe_unretained NSString *deadlineDate;
	__unsafe_unretained NSString *idealBackground;
	__unsafe_unretained NSString *opportunityID;
	__unsafe_unretained NSString *publishDate;
	__unsafe_unretained NSString *referenceContent;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *urlString;
} KSHProjectOpportunityAttributes;

extern const struct KSHProjectOpportunityRelationships {
	__unsafe_unretained NSString *ofConsultant;
} KSHProjectOpportunityRelationships;

extern const struct KSHProjectOpportunityFetchedProperties {
} KSHProjectOpportunityFetchedProperties;

@class KSHConsultant;










@interface KSHProjectOpportunityID : NSManagedObjectID {}
@end

@interface _KSHProjectOpportunity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHProjectOpportunityID*)objectID;





@property (nonatomic, strong) NSString* contacts;



//- (BOOL)validateContacts:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* deadlineDate;



//- (BOOL)validateDeadlineDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* idealBackground;



//- (BOOL)validateIdealBackground:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* opportunityID;



@property int32_t opportunityIDValue;
- (int32_t)opportunityIDValue;
- (void)setOpportunityIDValue:(int32_t)value_;

//- (BOOL)validateOpportunityID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* publishDate;



//- (BOOL)validatePublishDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* referenceContent;



//- (BOOL)validateReferenceContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* urlString;



//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *ofConsultant;

- (NSMutableSet*)ofConsultantSet;





@end

@interface _KSHProjectOpportunity (CoreDataGeneratedAccessors)

- (void)addOfConsultant:(NSSet*)value_;
- (void)removeOfConsultant:(NSSet*)value_;
- (void)addOfConsultantObject:(KSHConsultant*)value_;
- (void)removeOfConsultantObject:(KSHConsultant*)value_;

@end

@interface _KSHProjectOpportunity (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContacts;
- (void)setPrimitiveContacts:(NSString*)value;




- (NSDate*)primitiveDeadlineDate;
- (void)setPrimitiveDeadlineDate:(NSDate*)value;




- (NSString*)primitiveIdealBackground;
- (void)setPrimitiveIdealBackground:(NSString*)value;




- (NSNumber*)primitiveOpportunityID;
- (void)setPrimitiveOpportunityID:(NSNumber*)value;

- (int32_t)primitiveOpportunityIDValue;
- (void)setPrimitiveOpportunityIDValue:(int32_t)value_;




- (NSDate*)primitivePublishDate;
- (void)setPrimitivePublishDate:(NSDate*)value;




- (NSString*)primitiveReferenceContent;
- (void)setPrimitiveReferenceContent:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;





- (NSMutableSet*)primitiveOfConsultant;
- (void)setPrimitiveOfConsultant:(NSMutableSet*)value;


@end
