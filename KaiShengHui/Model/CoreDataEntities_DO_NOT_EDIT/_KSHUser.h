// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.h instead.

#import <CoreData/CoreData.h>


extern const struct KSHUserAttributes {
	__unsafe_unretained NSString *createDate;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *token;
	__unsafe_unretained NSString *updateDate;
	__unsafe_unretained NSString *userID;
	__unsafe_unretained NSString *username;
} KSHUserAttributes;

extern const struct KSHUserRelationships {
	__unsafe_unretained NSString *favorites;
	__unsafe_unretained NSString *hasProject;
	__unsafe_unretained NSString *userProfile;
} KSHUserRelationships;

extern const struct KSHUserFetchedProperties {
} KSHUserFetchedProperties;

@class KSHFavoritable;
@class KSHProject;
@class KSHProfile;








@interface KSHUserID : NSManagedObjectID {}
@end

@interface _KSHUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHUserID*)objectID;





@property (nonatomic, strong) NSDate* createDate;



//- (BOOL)validateCreateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* token;



//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateDate;



//- (BOOL)validateUpdateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userID;



//- (BOOL)validateUserID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *favorites;

- (NSMutableSet*)favoritesSet;




@property (nonatomic, strong) NSSet *hasProject;

- (NSMutableSet*)hasProjectSet;




@property (nonatomic, strong) KSHProfile *userProfile;

//- (BOOL)validateUserProfile:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHUser (CoreDataGeneratedAccessors)

- (void)addFavorites:(NSSet*)value_;
- (void)removeFavorites:(NSSet*)value_;
- (void)addFavoritesObject:(KSHFavoritable*)value_;
- (void)removeFavoritesObject:(KSHFavoritable*)value_;

- (void)addHasProject:(NSSet*)value_;
- (void)removeHasProject:(NSSet*)value_;
- (void)addHasProjectObject:(KSHProject*)value_;
- (void)removeHasProjectObject:(KSHProject*)value_;

@end

@interface _KSHUser (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreateDate;
- (void)setPrimitiveCreateDate:(NSDate*)value;




- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;




- (NSDate*)primitiveUpdateDate;
- (void)setPrimitiveUpdateDate:(NSDate*)value;




- (NSString*)primitiveUserID;
- (void)setPrimitiveUserID:(NSString*)value;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;





- (NSMutableSet*)primitiveFavorites;
- (void)setPrimitiveFavorites:(NSMutableSet*)value;



- (NSMutableSet*)primitiveHasProject;
- (void)setPrimitiveHasProject:(NSMutableSet*)value;



- (KSHProfile*)primitiveUserProfile;
- (void)setPrimitiveUserProfile:(KSHProfile*)value;


@end
