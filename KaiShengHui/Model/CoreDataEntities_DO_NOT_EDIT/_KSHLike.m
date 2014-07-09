// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLike.m instead.

#import "_KSHLike.h"

const struct KSHLikeAttributes KSHLikeAttributes = {
	.flag = @"flag",
};

const struct KSHLikeRelationships KSHLikeRelationships = {
	.article = @"article",
	.tag = @"tag",
	.user = @"user",
};

const struct KSHLikeFetchedProperties KSHLikeFetchedProperties = {
};

@implementation KSHLikeID
@end

@implementation _KSHLike

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Like" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Like";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Like" inManagedObjectContext:moc_];
}

- (KSHLikeID*)objectID {
	return (KSHLikeID*)[super objectID];
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





@dynamic article;

	

@dynamic tag;

	

@dynamic user;

	






@end
