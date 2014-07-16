// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHArticle.m instead.

#import "_KSHArticle.h"

const struct KSHArticleAttributes KSHArticleAttributes = {
	.articleID = @"articleID",
	.author = @"author",
	.content = @"content",
	.datePublished = @"datePublished",
	.dateUpdated = @"dateUpdated",
	.excerpt = @"excerpt",
	.function = @"function",
	.functionID = @"functionID",
	.imgFile = @"imgFile",
	.imgURLString = @"imgURLString",
	.industry = @"industry",
	.industryID = @"industryID",
	.tags = @"tags",
	.title = @"title",
	.typeID = @"typeID",
	.viewCount = @"viewCount",
};

const struct KSHArticleRelationships KSHArticleRelationships = {
	.disliked = @"disliked",
	.hasTag = @"hasTag",
	.liked = @"liked",
	.starred = @"starred",
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
	
	if ([key isEqualToString:@"articleIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"articleID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"authorValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"author"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"functionIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"functionID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industryID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"typeIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"typeID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"viewCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"viewCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic articleID;



- (int32_t)articleIDValue {
	NSNumber *result = [self articleID];
	return [result intValue];
}

- (void)setArticleIDValue:(int32_t)value_ {
	[self setArticleID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArticleIDValue {
	NSNumber *result = [self primitiveArticleID];
	return [result intValue];
}

- (void)setPrimitiveArticleIDValue:(int32_t)value_ {
	[self setPrimitiveArticleID:[NSNumber numberWithInt:value_]];
}





@dynamic author;



- (int32_t)authorValue {
	NSNumber *result = [self author];
	return [result intValue];
}

- (void)setAuthorValue:(int32_t)value_ {
	[self setAuthor:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAuthorValue {
	NSNumber *result = [self primitiveAuthor];
	return [result intValue];
}

- (void)setPrimitiveAuthorValue:(int32_t)value_ {
	[self setPrimitiveAuthor:[NSNumber numberWithInt:value_]];
}





@dynamic content;






@dynamic datePublished;






@dynamic dateUpdated;






@dynamic excerpt;






@dynamic function;






@dynamic functionID;



- (int32_t)functionIDValue {
	NSNumber *result = [self functionID];
	return [result intValue];
}

- (void)setFunctionIDValue:(int32_t)value_ {
	[self setFunctionID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFunctionIDValue {
	NSNumber *result = [self primitiveFunctionID];
	return [result intValue];
}

- (void)setPrimitiveFunctionIDValue:(int32_t)value_ {
	[self setPrimitiveFunctionID:[NSNumber numberWithInt:value_]];
}





@dynamic imgFile;






@dynamic imgURLString;






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






@dynamic title;






@dynamic typeID;



- (int32_t)typeIDValue {
	NSNumber *result = [self typeID];
	return [result intValue];
}

- (void)setTypeIDValue:(int32_t)value_ {
	[self setTypeID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTypeIDValue {
	NSNumber *result = [self primitiveTypeID];
	return [result intValue];
}

- (void)setPrimitiveTypeIDValue:(int32_t)value_ {
	[self setPrimitiveTypeID:[NSNumber numberWithInt:value_]];
}





@dynamic viewCount;



- (int32_t)viewCountValue {
	NSNumber *result = [self viewCount];
	return [result intValue];
}

- (void)setViewCountValue:(int32_t)value_ {
	[self setViewCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveViewCountValue {
	NSNumber *result = [self primitiveViewCount];
	return [result intValue];
}

- (void)setPrimitiveViewCountValue:(int32_t)value_ {
	[self setPrimitiveViewCount:[NSNumber numberWithInt:value_]];
}





@dynamic disliked;

	
- (NSMutableSet*)dislikedSet {
	[self willAccessValueForKey:@"disliked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"disliked"];
  
	[self didAccessValueForKey:@"disliked"];
	return result;
}
	

@dynamic hasTag;

	
- (NSMutableSet*)hasTagSet {
	[self willAccessValueForKey:@"hasTag"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasTag"];
  
	[self didAccessValueForKey:@"hasTag"];
	return result;
}
	

@dynamic liked;

	
- (NSMutableSet*)likedSet {
	[self willAccessValueForKey:@"liked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"liked"];
  
	[self didAccessValueForKey:@"liked"];
	return result;
}
	

@dynamic starred;

	
- (NSMutableSet*)starredSet {
	[self willAccessValueForKey:@"starred"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"starred"];
  
	[self didAccessValueForKey:@"starred"];
	return result;
}
	






@end
