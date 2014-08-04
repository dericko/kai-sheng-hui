// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFavoritable.m instead.

#import "_KSHFavoritable.h"

const struct KSHFavoritableAttributes KSHFavoritableAttributes = {
};

const struct KSHFavoritableRelationships KSHFavoritableRelationships = {
	.favoritedBy = @"favoritedBy",
};

const struct KSHFavoritableFetchedProperties KSHFavoritableFetchedProperties = {
};

@implementation KSHFavoritableID
@end

@implementation _KSHFavoritable

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Favoritable" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Favoritable";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Favoritable" inManagedObjectContext:moc_];
}

- (KSHFavoritableID*)objectID {
	return (KSHFavoritableID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic favoritedBy;

	






@end
