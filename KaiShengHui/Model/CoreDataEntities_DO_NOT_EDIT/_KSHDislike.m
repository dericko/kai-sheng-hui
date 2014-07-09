// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHDislike.m instead.

#import "_KSHDislike.h"

const struct KSHDislikeAttributes KSHDislikeAttributes = {
	.flag = @"flag",
};

const struct KSHDislikeRelationships KSHDislikeRelationships = {
	.article = @"article",
	.tag = @"tag",
	.user = @"user",
};

const struct KSHDislikeFetchedProperties KSHDislikeFetchedProperties = {
};

@implementation KSHDislikeID
@end

@implementation _KSHDislike

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Dislike" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Dislike";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Dislike" inManagedObjectContext:moc_];
}

- (KSHDislikeID*)objectID {
	return (KSHDislikeID*)[super objectID];
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
