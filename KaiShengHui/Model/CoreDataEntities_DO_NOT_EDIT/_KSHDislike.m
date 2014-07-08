// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHDislike.m instead.

#import "_KSHDislike.h"

const struct KSHDislikeAttributes KSHDislikeAttributes = {
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
	

	return keyPaths;
}




@dynamic article;

	

@dynamic tag;

	

@dynamic user;

	






@end
