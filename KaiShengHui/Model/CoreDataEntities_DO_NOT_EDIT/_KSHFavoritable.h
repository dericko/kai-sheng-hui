// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFavoritable.h instead.

#import <CoreData/CoreData.h>
#import "KSHFetchable.h"

extern const struct KSHFavoritableAttributes {
} KSHFavoritableAttributes;

extern const struct KSHFavoritableRelationships {
	__unsafe_unretained NSString *favoritedBy;
} KSHFavoritableRelationships;

extern const struct KSHFavoritableFetchedProperties {
} KSHFavoritableFetchedProperties;

@class KSHUser;


@interface KSHFavoritableID : NSManagedObjectID {}
@end

@interface _KSHFavoritable : KSHFetchable {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (KSHFavoritableID*)objectID;





@property (nonatomic, strong) KSHUser *favoritedBy;

//- (BOOL)validateFavoritedBy:(id*)value_ error:(NSError**)error_;





@end

@interface _KSHFavoritable (CoreDataGeneratedAccessors)

@end

@interface _KSHFavoritable (CoreDataGeneratedPrimitiveAccessors)



- (KSHUser*)primitiveFavoritedBy;
- (void)setPrimitiveFavoritedBy:(KSHUser*)value;


@end
