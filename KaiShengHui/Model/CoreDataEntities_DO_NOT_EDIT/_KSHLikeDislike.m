// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLikeDislike.m instead.

#import "_KSHLikeDislike.h"

const struct KSHLikeDislikeAttributes KSHLikeDislikeAttributes = {
	.createdAt = @"createdAt",
	.deletedAt = @"deletedAt",
	.flag = @"flag",
};

const struct KSHLikeDislikeRelationships KSHLikeDislikeRelationships = {
};

const struct KSHLikeDislikeFetchedProperties KSHLikeDislikeFetchedProperties = {
};

@implementation KSHLikeDislikeID
@end

@implementation _KSHLikeDislike

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LikeDislike" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LikeDislike";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LikeDislike" inManagedObjectContext:moc_];
}

- (KSHLikeDislikeID*)objectID {
	return (KSHLikeDislikeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"flagValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"flag"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic deletedAt;






@dynamic flag;



- (BOOL)flagValue {
	NSNumber *result = [self flag];
	return [result boolValue];
}

- (void)setFlagValue:(BOOL)value_ {
	[self setFlag:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveFlagValue {
	NSNumber *result = [self primitiveFlag];
	return [result boolValue];
}

- (void)setPrimitiveFlagValue:(BOOL)value_ {
	[self setPrimitiveFlag:[NSNumber numberWithBool:value_]];
}










@end
