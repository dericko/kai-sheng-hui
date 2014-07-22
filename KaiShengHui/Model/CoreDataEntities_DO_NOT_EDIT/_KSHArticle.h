// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.h instead.

#import <CoreData/CoreData.h>
#import "KSHPost.h"

extern const struct KSHArticleAttributes {
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *industryID;
	__unsafe_unretained NSString *tags;
} KSHArticleAttributes;

extern const struct KSHArticleRelationships {
	__unsafe_unretained NSString *hasTopic;
} KSHArticleRelationships;

extern const struct KSHArticleFetchedProperties {
} KSHArticleFetchedProperties;

@class KSHTopic;





@interface KSHArticleID : NSManagedObjectID {}
@end

@interface _KSHArticle : KSHPost {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHArticleID*)objectID;





@property (nonatomic, strong) NSString* industry;



//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industryID;



@property int16_t industryIDValue;
- (int16_t)industryIDValue;
- (void)setIndustryIDValue:(int16_t)value_;

//- (BOOL)validateIndustryID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* tags;



//- (BOOL)validateTags:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *hasTopic;

- (NSMutableSet*)hasTopicSet;





@end

@interface _KSHArticle (CoreDataGeneratedAccessors)

- (void)addHasTopic:(NSSet*)value_;
- (void)removeHasTopic:(NSSet*)value_;
- (void)addHasTopicObject:(KSHTopic*)value_;
- (void)removeHasTopicObject:(KSHTopic*)value_;

@end

@interface _KSHArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSString*)value;




- (NSNumber*)primitiveIndustryID;
- (void)setPrimitiveIndustryID:(NSNumber*)value;

- (int16_t)primitiveIndustryIDValue;
- (void)setPrimitiveIndustryIDValue:(int16_t)value_;




- (NSString*)primitiveTags;
- (void)setPrimitiveTags:(NSString*)value;





- (NSMutableSet*)primitiveHasTopic;
- (void)setPrimitiveHasTopic:(NSMutableSet*)value;


@end
