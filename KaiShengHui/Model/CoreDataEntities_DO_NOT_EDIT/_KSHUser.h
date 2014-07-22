// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHUserAttributes {
	__unsafe_unretained NSString *currentUser;
	__unsafe_unretained NSString *token;
	__unsafe_unretained NSString *userID;
	__unsafe_unretained NSString *username;
} KSHUserAttributes;

extern const struct KSHUserRelationships {
	__unsafe_unretained NSString *dislikes;
	__unsafe_unretained NSString *favorites;
	__unsafe_unretained NSString *likes;
	__unsafe_unretained NSString *userProfile;
} KSHUserRelationships;

extern const struct KSHUserFetchedProperties {
} KSHUserFetchedProperties;

@class KSHTopic;
@class KSHPost;
@class KSHTopic;
@class KSHProfile;






@interface KSHUserID : NSManagedObjectID {}
@end

@interface _KSHUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHUserID*)objectID;





@property (nonatomic, strong) NSNumber* currentUser;



@property BOOL currentUserValue;
- (BOOL)currentUserValue;
- (void)setCurrentUserValue:(BOOL)value_;

//- (BOOL)validateCurrentUser:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* token;



//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userID;



@property int32_t userIDValue;
- (int32_t)userIDValue;
- (void)setUserIDValue:(int32_t)value_;

//- (BOOL)validateUserID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *dislikes;

- (NSMutableSet*)dislikesSet;




@property (nonatomic, strong) NSSet *favorites;

- (NSMutableSet*)favoritesSet;




@property (nonatomic, strong) NSSet *likes;

- (NSMutableSet*)likesSet;




@property (nonatomic, strong) KSHProfile *userProfile;

//- (BOOL)validateUserProfile:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHUser (CoreDataGeneratedAccessors)

- (void)addDislikes:(NSSet*)value_;
- (void)removeDislikes:(NSSet*)value_;
- (void)addDislikesObject:(KSHTopic*)value_;
- (void)removeDislikesObject:(KSHTopic*)value_;

- (void)addFavorites:(NSSet*)value_;
- (void)removeFavorites:(NSSet*)value_;
- (void)addFavoritesObject:(KSHPost*)value_;
- (void)removeFavoritesObject:(KSHPost*)value_;

- (void)addLikes:(NSSet*)value_;
- (void)removeLikes:(NSSet*)value_;
- (void)addLikesObject:(KSHTopic*)value_;
- (void)removeLikesObject:(KSHTopic*)value_;

@end

@interface _KSHUser (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCurrentUser;
- (void)setPrimitiveCurrentUser:(NSNumber*)value;

- (BOOL)primitiveCurrentUserValue;
- (void)setPrimitiveCurrentUserValue:(BOOL)value_;




- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;




- (NSNumber*)primitiveUserID;
- (void)setPrimitiveUserID:(NSNumber*)value;

- (int32_t)primitiveUserIDValue;
- (void)setPrimitiveUserIDValue:(int32_t)value_;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;





- (NSMutableSet*)primitiveDislikes;
- (void)setPrimitiveDislikes:(NSMutableSet*)value;



- (NSMutableSet*)primitiveFavorites;
- (void)setPrimitiveFavorites:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLikes;
- (void)setPrimitiveLikes:(NSMutableSet*)value;



- (KSHProfile*)primitiveUserProfile;
- (void)setPrimitiveUserProfile:(KSHProfile*)value;


@end
