// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTopic.m instead.

#import "_KSHTopic.h"

const struct KSHTopicAttributes KSHTopicAttributes = {
	.name = @"name",
	.topicID = @"topicID",
	.type = @"type",
};

const struct KSHTopicRelationships KSHTopicRelationships = {
	.ofArticle = @"ofArticle",
};

const struct KSHTopicFetchedProperties KSHTopicFetchedProperties = {
};

@implementation KSHTopicID
@end

@implementation _KSHTopic

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Topic";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Topic" inManagedObjectContext:moc_];
}

- (KSHTopicID*)objectID {
	return (KSHTopicID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"topicIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"topicID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic name;






@dynamic topicID;



- (int32_t)topicIDValue {
	NSNumber *result = [self topicID];
	return [result intValue];
}

- (void)setTopicIDValue:(int32_t)value_ {
	[self setTopicID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTopicIDValue {
	NSNumber *result = [self primitiveTopicID];
	return [result intValue];
}

- (void)setPrimitiveTopicIDValue:(int32_t)value_ {
	[self setPrimitiveTopicID:[NSNumber numberWithInt:value_]];
}





@dynamic type;



- (int16_t)typeValue {
	NSNumber *result = [self type];
	return [result shortValue];
}

- (void)setTypeValue:(int16_t)value_ {
	[self setType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTypeValue {
	NSNumber *result = [self primitiveType];
	return [result shortValue];
}

- (void)setPrimitiveTypeValue:(int16_t)value_ {
	[self setPrimitiveType:[NSNumber numberWithShort:value_]];
}





@dynamic ofArticle;

	






@end
