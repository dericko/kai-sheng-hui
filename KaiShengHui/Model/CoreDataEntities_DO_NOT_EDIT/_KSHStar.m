// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHStar.m instead.

#import "_KSHStar.h"

const struct KSHStarAttributes KSHStarAttributes = {
};

const struct KSHStarRelationships KSHStarRelationships = {
	.article = @"article",
	.user = @"user",
};

const struct KSHStarFetchedProperties KSHStarFetchedProperties = {
};

@implementation KSHStarID
@end

@implementation _KSHStar

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Star" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Star";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Star" inManagedObjectContext:moc_];
}

- (KSHStarID*)objectID {
	return (KSHStarID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic article;

	

@dynamic user;

	






@end
