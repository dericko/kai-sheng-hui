// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHPost.m instead.

#import "_KSHPost.h"

const struct KSHPostAttributes KSHPostAttributes = {
	.content = @"content",
	.creator = @"creator",
	.editor = @"editor",
	.excerpt = @"excerpt",
	.fileType = @"fileType",
	.guestContent = @"guestContent",
	.homePage = @"homePage",
	.imgFile = @"imgFile",
	.imgURLString = @"imgURLString",
	.postType = @"postType",
	.title = @"title",
	.viewCount = @"viewCount",
};

const struct KSHPostRelationships KSHPostRelationships = {
};

const struct KSHPostFetchedProperties KSHPostFetchedProperties = {
};

@implementation KSHPostID
@end

@implementation _KSHPost

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Post";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Post" inManagedObjectContext:moc_];
}

- (KSHPostID*)objectID {
	return (KSHPostID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"creatorValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"creator"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"editorValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"editor"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"fileTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fileType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"homePageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"homePage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"postTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"postType"];
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




@dynamic content;






@dynamic creator;



- (int32_t)creatorValue {
	NSNumber *result = [self creator];
	return [result intValue];
}

- (void)setCreatorValue:(int32_t)value_ {
	[self setCreator:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCreatorValue {
	NSNumber *result = [self primitiveCreator];
	return [result intValue];
}

- (void)setPrimitiveCreatorValue:(int32_t)value_ {
	[self setPrimitiveCreator:[NSNumber numberWithInt:value_]];
}





@dynamic editor;



- (int32_t)editorValue {
	NSNumber *result = [self editor];
	return [result intValue];
}

- (void)setEditorValue:(int32_t)value_ {
	[self setEditor:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEditorValue {
	NSNumber *result = [self primitiveEditor];
	return [result intValue];
}

- (void)setPrimitiveEditorValue:(int32_t)value_ {
	[self setPrimitiveEditor:[NSNumber numberWithInt:value_]];
}





@dynamic excerpt;






@dynamic fileType;



- (int16_t)fileTypeValue {
	NSNumber *result = [self fileType];
	return [result shortValue];
}

- (void)setFileTypeValue:(int16_t)value_ {
	[self setFileType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFileTypeValue {
	NSNumber *result = [self primitiveFileType];
	return [result shortValue];
}

- (void)setPrimitiveFileTypeValue:(int16_t)value_ {
	[self setPrimitiveFileType:[NSNumber numberWithShort:value_]];
}





@dynamic guestContent;






@dynamic homePage;



- (BOOL)homePageValue {
	NSNumber *result = [self homePage];
	return [result boolValue];
}

- (void)setHomePageValue:(BOOL)value_ {
	[self setHomePage:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveHomePageValue {
	NSNumber *result = [self primitiveHomePage];
	return [result boolValue];
}

- (void)setPrimitiveHomePageValue:(BOOL)value_ {
	[self setPrimitiveHomePage:[NSNumber numberWithBool:value_]];
}





@dynamic imgFile;






@dynamic imgURLString;






@dynamic postType;



- (int16_t)postTypeValue {
	NSNumber *result = [self postType];
	return [result shortValue];
}

- (void)setPostTypeValue:(int16_t)value_ {
	[self setPostType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePostTypeValue {
	NSNumber *result = [self primitivePostType];
	return [result shortValue];
}

- (void)setPrimitivePostTypeValue:(int16_t)value_ {
	[self setPrimitivePostType:[NSNumber numberWithShort:value_]];
}





@dynamic title;






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










@end
