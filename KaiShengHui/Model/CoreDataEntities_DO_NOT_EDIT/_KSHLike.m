// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLike.m instead.

#import "_KSHLike.h"

const struct KSHLikeAttributes KSHLikeAttributes = {
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
	

	return keyPaths;
}




@dynamic article;

	

@dynamic tag;

	

@dynamic user;

	






@end
