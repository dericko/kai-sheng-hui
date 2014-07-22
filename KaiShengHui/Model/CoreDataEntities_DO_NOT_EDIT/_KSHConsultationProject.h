// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultationProject.h instead.

#import <CoreData/CoreData.h>
#import "KSHProject.h"

extern const struct KSHConsultationProjectAttributes {
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *revealClientName;
} KSHConsultationProjectAttributes;

extern const struct KSHConsultationProjectRelationships {
} KSHConsultationProjectRelationships;

extern const struct KSHConsultationProjectFetchedProperties {
} KSHConsultationProjectFetchedProperties;





@interface KSHConsultationProjectID : NSManagedObjectID {}
@end

@interface _KSHConsultationProject : KSHProject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHConsultationProjectID*)objectID;





@property (nonatomic, strong) NSString* location;



//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* revealClientName;



@property int16_t revealClientNameValue;
- (int16_t)revealClientNameValue;
- (void)setRevealClientNameValue:(int16_t)value_;

//- (BOOL)validateRevealClientName:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHConsultationProject (CoreDataGeneratedAccessors)

@end

@interface _KSHConsultationProject (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveLocation;
- (void)setPrimitiveLocation:(NSString*)value;




- (NSNumber*)primitiveRevealClientName;
- (void)setPrimitiveRevealClientName:(NSNumber*)value;

- (int16_t)primitiveRevealClientNameValue;
- (void)setPrimitiveRevealClientNameValue:(int16_t)value_;




@end
