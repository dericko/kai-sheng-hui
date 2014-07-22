// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.m instead.

#import "_KSHArticle.h"

const struct KSHArticleAttributes KSHArticleAttributes = {
	.industry = @"industry",
	.industryID = @"industryID",
	.tags = @"tags",
};

const struct KSHArticleRelationships KSHArticleRelationships = {
	.hasTopic = @"hasTopic",
};

const struct KSHArticleFetchedProperties KSHArticleFetchedProperties = {
};

@implementation KSHArticleID
@end

@implementation _KSHArticle

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Article";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Article" inManagedObjectContext:moc_];
}

- (KSHArticleID*)objectID {
	return (KSHArticleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"industryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industryID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic industry;






@dynamic industryID;



- (int16_t)industryIDValue {
	NSNumber *result = [self industryID];
	return [result shortValue];
}

- (void)setIndustryIDValue:(int16_t)value_ {
	[self setIndustryID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIndustryIDValue {
	NSNumber *result = [self primitiveIndustryID];
	return [result shortValue];
}

- (void)setPrimitiveIndustryIDValue:(int16_t)value_ {
	[self setPrimitiveIndustryID:[NSNumber numberWithShort:value_]];
}





@dynamic tags;






@dynamic hasTopic;

	
- (NSMutableSet*)hasTopicSet {
	[self willAccessValueForKey:@"hasTopic"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasTopic"];
  
	[self didAccessValueForKey:@"hasTopic"];
	return result;
}
	






@end
