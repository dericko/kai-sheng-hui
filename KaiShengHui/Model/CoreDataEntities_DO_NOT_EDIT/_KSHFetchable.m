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
	
	if ([key isEqualToString:@"entityIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"entityID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createDate;






@dynamic entityID;



- (int32_t)entityIDValue {
	NSNumber *result = [self entityID];
	return [result intValue];
}

- (void)setEntityIDValue:(int32_t)value_ {
	[self setEntityID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEntityIDValue {
	NSNumber *result = [self primitiveEntityID];
	return [result intValue];
}

- (void)setPrimitiveEntityIDValue:(int32_t)value_ {
	[self setPrimitiveEntityID:[NSNumber numberWithInt:value_]];
}





@dynamic updateDate;











@end
