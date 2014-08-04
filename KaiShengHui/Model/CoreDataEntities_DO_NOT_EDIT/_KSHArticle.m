// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.m instead.

#import "_KSHArticle.h"

const struct KSHArticleAttributes KSHArticleAttributes = {
	.fetchableType = @"fetchableType",
	.function = @"function",
	.industry = @"industry",
	.industryName = @"industryName",
	.source = @"source",
	.sourceName = @"sourceName",
	.tags = @"tags",
	.type = @"type",
};

const struct KSHArticleRelationships KSHArticleRelationships = {
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
	
	if ([key isEqualToString:@"fetchableTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fetchableType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industry"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"sourceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"source"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic fetchableType;



- (int16_t)fetchableTypeValue {
	NSNumber *result = [self fetchableType];
	return [result shortValue];
}

- (void)setFetchableTypeValue:(int16_t)value_ {
	[self setFetchableType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFetchableTypeValue {
	NSNumber *result = [self primitiveFetchableType];
	return [result shortValue];
}

- (void)setPrimitiveFetchableTypeValue:(int16_t)value_ {
	[self setPrimitiveFetchableType:[NSNumber numberWithShort:value_]];
}





@dynamic function;






@dynamic industry;



- (int16_t)industryValue {
	NSNumber *result = [self industry];
	return [result shortValue];
}

- (void)setIndustryValue:(int16_t)value_ {
	[self setIndustry:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIndustryValue {
	NSNumber *result = [self primitiveIndustry];
	return [result shortValue];
}

- (void)setPrimitiveIndustryValue:(int16_t)value_ {
	[self setPrimitiveIndustry:[NSNumber numberWithShort:value_]];
}





@dynamic industryName;






@dynamic source;



- (int32_t)sourceValue {
	NSNumber *result = [self source];
	return [result intValue];
}

- (void)setSourceValue:(int32_t)value_ {
	[self setSource:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSourceValue {
	NSNumber *result = [self primitiveSource];
	return [result intValue];
}

- (void)setPrimitiveSourceValue:(int32_t)value_ {
	[self setPrimitiveSource:[NSNumber numberWithInt:value_]];
}





@dynamic sourceName;






@dynamic tags;






@dynamic type;











@end
