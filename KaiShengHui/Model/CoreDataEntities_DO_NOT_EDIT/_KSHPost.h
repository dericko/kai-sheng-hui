// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHPost.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHPostAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *creator;
	__unsafe_unretained NSString *editor;
	__unsafe_unretained NSString *excerpt;
	__unsafe_unretained NSString *fileType;
	__unsafe_unretained NSString *guestContent;
	__unsafe_unretained NSString *homePage;
	__unsafe_unretained NSString *imgFile;
	__unsafe_unretained NSString *imgURLString;
	__unsafe_unretained NSString *postID;
	__unsafe_unretained NSString *postType;
	__unsafe_unretained NSString *publishTime;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *updateTime;
	__unsafe_unretained NSString *viewCount;
} KSHPostAttributes;

extern const struct KSHPostRelationships {
	__unsafe_unretained NSString *favoritedBy;
} KSHPostRelationships;

extern const struct KSHPostFetchedProperties {
} KSHPostFetchedProperties;

@class KSHUser;

















@interface KSHPostID : NSManagedObjectID {}
@end

@interface _KSHPost : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHPostID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* creator;



@property int32_t creatorValue;
- (int32_t)creatorValue;
- (void)setCreatorValue:(int32_t)value_;

//- (BOOL)validateCreator:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* editor;



@property int32_t editorValue;
- (int32_t)editorValue;
- (void)setEditorValue:(int32_t)value_;

//- (BOOL)validateEditor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* excerpt;



//- (BOOL)validateExcerpt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fileType;



@property int16_t fileTypeValue;
- (int16_t)fileTypeValue;
- (void)setFileTypeValue:(int16_t)value_;

//- (BOOL)validateFileType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* guestContent;



//- (BOOL)validateGuestContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* homePage;



@property BOOL homePageValue;
- (BOOL)homePageValue;
- (void)setHomePageValue:(BOOL)value_;

//- (BOOL)validateHomePage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* imgFile;



//- (BOOL)validateImgFile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imgURLString;



//- (BOOL)validateImgURLString:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* postID;



@property int32_t postIDValue;
- (int32_t)postIDValue;
- (void)setPostIDValue:(int32_t)value_;

//- (BOOL)validatePostID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* postType;



@property int16_t postTypeValue;
- (int16_t)postTypeValue;
- (void)setPostTypeValue:(int16_t)value_;

//- (BOOL)validatePostType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* publishTime;



//- (BOOL)validatePublishTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateTime;



//- (BOOL)validateUpdateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* viewCount;



@property int32_t viewCountValue;
- (int32_t)viewCountValue;
- (void)setViewCountValue:(int32_t)value_;

//- (BOOL)validateViewCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *favoritedBy;

- (NSMutableSet*)favoritedBySet;





@end

@interface _KSHPost (CoreDataGeneratedAccessors)

- (void)addFavoritedBy:(NSSet*)value_;
- (void)removeFavoritedBy:(NSSet*)value_;
- (void)addFavoritedByObject:(KSHUser*)value_;
- (void)removeFavoritedByObject:(KSHUser*)value_;

@end

@interface _KSHPost (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSNumber*)primitiveCreator;
- (void)setPrimitiveCreator:(NSNumber*)value;

- (int32_t)primitiveCreatorValue;
- (void)setPrimitiveCreatorValue:(int32_t)value_;




- (NSNumber*)primitiveEditor;
- (void)setPrimitiveEditor:(NSNumber*)value;

- (int32_t)primitiveEditorValue;
- (void)setPrimitiveEditorValue:(int32_t)value_;




- (NSString*)primitiveExcerpt;
- (void)setPrimitiveExcerpt:(NSString*)value;




- (NSNumber*)primitiveFileType;
- (void)setPrimitiveFileType:(NSNumber*)value;

- (int16_t)primitiveFileTypeValue;
- (void)setPrimitiveFileTypeValue:(int16_t)value_;




- (NSString*)primitiveGuestContent;
- (void)setPrimitiveGuestContent:(NSString*)value;




- (NSNumber*)primitiveHomePage;
- (void)setPrimitiveHomePage:(NSNumber*)value;

- (BOOL)primitiveHomePageValue;
- (void)setPrimitiveHomePageValue:(BOOL)value_;




- (NSData*)primitiveImgFile;
- (void)setPrimitiveImgFile:(NSData*)value;




- (NSString*)primitiveImgURLString;
- (void)setPrimitiveImgURLString:(NSString*)value;




- (NSNumber*)primitivePostID;
- (void)setPrimitivePostID:(NSNumber*)value;

- (int32_t)primitivePostIDValue;
- (void)setPrimitivePostIDValue:(int32_t)value_;




- (NSNumber*)primitivePostType;
- (void)setPrimitivePostType:(NSNumber*)value;

- (int16_t)primitivePostTypeValue;
- (void)setPrimitivePostTypeValue:(int16_t)value_;




- (NSDate*)primitivePublishTime;
- (void)setPrimitivePublishTime:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSDate*)primitiveUpdateTime;
- (void)setPrimitiveUpdateTime:(NSDate*)value;




- (NSNumber*)primitiveViewCount;
- (void)setPrimitiveViewCount:(NSNumber*)value;

- (int32_t)primitiveViewCountValue;
- (void)setPrimitiveViewCountValue:(int32_t)value_;





- (NSMutableSet*)primitiveFavoritedBy;
- (void)setPrimitiveFavoritedBy:(NSMutableSet*)value;


@end
