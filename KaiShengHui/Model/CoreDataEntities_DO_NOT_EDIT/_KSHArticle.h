// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHArticleAttributes {
	__unsafe_unretained NSString *articleID;
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *datePublished;
	__unsafe_unretained NSString *dateUpdated;
	__unsafe_unretained NSString *excerpt;
	__unsafe_unretained NSString *function;
	__unsafe_unretained NSString *functionID;
	__unsafe_unretained NSString *imgFile;
	__unsafe_unretained NSString *imgURLString;
	__unsafe_unretained NSString *industry;
	__unsafe_unretained NSString *industryID;
	__unsafe_unretained NSString *tags;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *typeID;
	__unsafe_unretained NSString *viewCount;
} KSHArticleAttributes;

extern const struct KSHArticleRelationships {
	__unsafe_unretained NSString *disliked;
	__unsafe_unretained NSString *hasTag;
	__unsafe_unretained NSString *liked;
	__unsafe_unretained NSString *starred;
} KSHArticleRelationships;

extern const struct KSHArticleFetchedProperties {
} KSHArticleFetchedProperties;

@class KSHLike;
@class KSHTag;
@class KSHDislike;
@class KSHStar;


















@interface KSHArticleID : NSManagedObjectID {}
@end

@interface _KSHArticle : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHArticleID*)objectID;





@property (nonatomic, strong) NSNumber* articleID;



@property int32_t articleIDValue;
- (int32_t)articleIDValue;
- (void)setArticleIDValue:(int32_t)value_;

//- (BOOL)validateArticleID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* author;



@property int32_t authorValue;
- (int32_t)authorValue;
- (void)setAuthorValue:(int32_t)value_;

//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* datePublished;



//- (BOOL)validateDatePublished:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateUpdated;



//- (BOOL)validateDateUpdated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* excerpt;



//- (BOOL)validateExcerpt:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSString* tags;



//- (BOOL)validateTags:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* typeID;



@property int32_t typeIDValue;
- (int32_t)typeIDValue;
- (void)setTypeIDValue:(int32_t)value_;

//- (BOOL)validateTypeID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* viewCount;



@property int32_t viewCountValue;
- (int32_t)viewCountValue;
- (void)setViewCountValue:(int32_t)value_;

//- (BOOL)validateViewCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *disliked;

- (NSMutableSet*)dislikedSet;




@property (nonatomic, strong) NSSet *hasTag;

- (NSMutableSet*)hasTagSet;




@property (nonatomic, strong) NSSet *liked;

- (NSMutableSet*)likedSet;




@property (nonatomic, strong) NSSet *starred;

- (NSMutableSet*)starredSet;





@end

@interface _KSHArticle (CoreDataGeneratedAccessors)

- (void)addDisliked:(NSSet*)value_;
- (void)removeDisliked:(NSSet*)value_;
- (void)addDislikedObject:(KSHLike*)value_;
- (void)removeDislikedObject:(KSHLike*)value_;

- (void)addHasTag:(NSSet*)value_;
- (void)removeHasTag:(NSSet*)value_;
- (void)addHasTagObject:(KSHTag*)value_;
- (void)removeHasTagObject:(KSHTag*)value_;

- (void)addLiked:(NSSet*)value_;
- (void)removeLiked:(NSSet*)value_;
- (void)addLikedObject:(KSHDislike*)value_;
- (void)removeLikedObject:(KSHDislike*)value_;

- (void)addStarred:(NSSet*)value_;
- (void)removeStarred:(NSSet*)value_;
- (void)addStarredObject:(KSHStar*)value_;
- (void)removeStarredObject:(KSHStar*)value_;

@end

@interface _KSHArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveArticleID;
- (void)setPrimitiveArticleID:(NSNumber*)value;

- (int32_t)primitiveArticleIDValue;
- (void)setPrimitiveArticleIDValue:(int32_t)value_;




- (NSNumber*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSNumber*)value;

- (int32_t)primitiveAuthorValue;
- (void)setPrimitiveAuthorValue:(int32_t)value_;




- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveDatePublished;
- (void)setPrimitiveDatePublished:(NSDate*)value;




- (NSDate*)primitiveDateUpdated;
- (void)setPrimitiveDateUpdated:(NSDate*)value;




- (NSString*)primitiveExcerpt;
- (void)setPrimitiveExcerpt:(NSString*)value;




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




- (NSString*)primitiveTags;
- (void)setPrimitiveTags:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveTypeID;
- (void)setPrimitiveTypeID:(NSNumber*)value;

- (int32_t)primitiveTypeIDValue;
- (void)setPrimitiveTypeIDValue:(int32_t)value_;




- (NSNumber*)primitiveViewCount;
- (void)setPrimitiveViewCount:(NSNumber*)value;

- (int32_t)primitiveViewCountValue;
- (void)setPrimitiveViewCountValue:(int32_t)value_;





- (NSMutableSet*)primitiveDisliked;
- (void)setPrimitiveDisliked:(NSMutableSet*)value;



- (NSMutableSet*)primitiveHasTag;
- (void)setPrimitiveHasTag:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLiked;
- (void)setPrimitiveLiked:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStarred;
- (void)setPrimitiveStarred:(NSMutableSet*)value;


@end
