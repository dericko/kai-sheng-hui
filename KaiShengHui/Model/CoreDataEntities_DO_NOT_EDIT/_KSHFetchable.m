// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFetchable.m instead.

#import "_KSHFetchable.h"

const struct KSHFetchableAttributes KSHFetchableAttributes = {
	.createDate = @"createDate",
	.entityID = @"entityID",
	.updateDate = @"updateDate",
};

const struct KSHFetchableRelationships KSHFetchableRelationships = {
};

const struct KSHFetchableFetchedProperties KSHFetchableFetchedProperties = {
};

@implementation KSHFetchableID
@end

@implementation _KSHFetchable

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Fetchable" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Fetchable";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Fetchable" inManagedObjectContext:moc_];
}

- (KSHFetchableID*)objectID {
	return (KSHFetchableID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic createDate;






@dynamic entityID;






@dynamic updateDate;











@end
