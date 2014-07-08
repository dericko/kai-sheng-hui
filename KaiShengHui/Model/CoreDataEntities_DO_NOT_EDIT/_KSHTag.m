// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTag.m instead.

#import "_KSHTag.h"

const struct KSHTagAttributes KSHTagAttributes = {
	.tag = @"tag",
	.tagID = @"tagID",
};

const struct KSHTagRelationships KSHTagRelationships = {
	.disliked = @"disliked",
	.liked = @"liked",
	.ofArticle = @"ofArticle",
};

const struct KSHTagFetchedProperties KSHTagFetchedProperties = {
};

@implementation KSHTagID
@end

@implementation _KSHTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (KSHTagID*)objectID {
	return (KSHTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"tagIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"tagID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic tag;






@dynamic tagID;



- (int32_t)tagIDValue {
	NSNumber *result = [self tagID];
	return [result intValue];
}

- (void)setTagIDValue:(int32_t)value_ {
	[self setTagID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTagIDValue {
	NSNumber *result = [self primitiveTagID];
	return [result intValue];
}

- (void)setPrimitiveTagIDValue:(int32_t)value_ {
	[self setPrimitiveTagID:[NSNumber numberWithInt:value_]];
}





@dynamic disliked;

	
- (NSMutableSet*)dislikedSet {
	[self willAccessValueForKey:@"disliked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"disliked"];
  
	[self didAccessValueForKey:@"disliked"];
	return result;
}
	

@dynamic liked;

	
- (NSMutableSet*)likedSet {
	[self willAccessValueForKey:@"liked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"liked"];
  
	[self didAccessValueForKey:@"liked"];
	return result;
}
	

@dynamic ofArticle;

	






@end
