// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.h instead.

#import <CoreData/CoreData.h>
#import "KSHPost.h"

extern const struct KSHArticleAttributes {
	__unsafe_unretained NSString *fetchableType;
	__unsafe_unretained NSString *function;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *industryName;
	__unsafe_unretained NSString *source;
	__unsafe_unretained NSString *sourceName;
	__unsafe_unretained NSString *tags;
	__unsafe_unretained NSString *type;
} KSHArticleAttributes;

extern const struct KSHArticleRelationships {
} KSHArticleRelationships;

extern const struct KSHArticleFetchedProperties {
} KSHArticleFetchedProperties;











@interface KSHArticleID : NSManagedObjectID {}
@end

@interface _KSHArticle : KSHPost {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHArticleID*)objectID;





@property (nonatomic, strong) NSNumber* fetchableType;



@property int16_t fetchableTypeValue;
- (int16_t)fetchableTypeValue;
- (void)setFetchableTypeValue:(int16_t)value_;

//- (BOOL)validateFetchableType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* function;



//- (BOOL)validateFunction:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* industry;



@property int16_t industryValue;
- (int16_t)industryValue;
- (void)setIndustryValue:(int16_t)value_;

//- (BOOL)validateIndustry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* industryName;



//- (BOOL)validateIndustryName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* source;



@property int32_t sourceValue;
- (int32_t)sourceValue;
- (void)setSourceValue:(int32_t)value_;

//- (BOOL)validateSource:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* sourceName;



//- (BOOL)validateSourceName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* tags;



//- (BOOL)validateTags:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _KSHArticle (CoreDataGeneratedAccessors)

@end

@interface _KSHArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveFetchableType;
- (void)setPrimitiveFetchableType:(NSNumber*)value;

- (int16_t)primitiveFetchableTypeValue;
- (void)setPrimitiveFetchableTypeValue:(int16_t)value_;




- (NSString*)primitiveFunction;
- (void)setPrimitiveFunction:(NSString*)value;




- (NSNumber*)primitiveIndustry;
- (void)setPrimitiveIndustry:(NSNumber*)value;

- (int16_t)primitiveIndustryValue;
- (void)setPrimitiveIndustryValue:(int16_t)value_;




- (NSString*)primitiveIndustryName;
- (void)setPrimitiveIndustryName:(NSString*)value;




- (NSNumber*)primitiveSource;
- (void)setPrimitiveSource:(NSNumber*)value;

- (int32_t)primitiveSourceValue;
- (void)setPrimitiveSourceValue:(int32_t)value_;




- (NSString*)primitiveSourceName;
- (void)setPrimitiveSourceName:(NSString*)value;




- (NSString*)primitiveTags;
- (void)setPrimitiveTags:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




@end
