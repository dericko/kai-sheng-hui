// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProject.m instead.

#import "_KSHProject.h"

const struct KSHProjectAttributes KSHProjectAttributes = {
	.category = @"category",
	.currencyUnit = @"currencyUnit",
	.endDate = @"endDate",
	.fetchableType = @"fetchableType",
	.industry = @"industry",
	.name = @"name",
	.price = @"price",
	.priority = @"priority",
	.projectDescription = @"projectDescription",
	.startDate = @"startDate",
	.status = @"status",
	.statusTime = @"statusTime",
	.timeframe = @"timeframe",
	.type = @"type",
};

const struct KSHProjectRelationships KSHProjectRelationships = {
	.hasFeedback = @"hasFeedback",
	.hasTask = @"hasTask",
	.ofUser = @"ofUser",
};

const struct KSHProjectFetchedProperties KSHProjectFetchedProperties = {
};

@implementation KSHProjectID
@end

@implementation _KSHProject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Project";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc_];
}

- (KSHProjectID*)objectID {
	return (KSHProjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"categoryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"category"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
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
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priorityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"priority"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"statusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"status"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timeframeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timeframe"];
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




@dynamic category;



- (int16_t)categoryValue {
	NSNumber *result = [self category];
	return [result shortValue];
}

- (void)setCategoryValue:(int16_t)value_ {
	[self setCategory:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCategoryValue {
	NSNumber *result = [self primitiveCategory];
	return [result shortValue];
}

- (void)setPrimitiveCategoryValue:(int16_t)value_ {
	[self setPrimitiveCategory:[NSNumber numberWithShort:value_]];
}





@dynamic currencyUnit;






@dynamic endDate;






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





@dynamic name;






@dynamic price;



- (int32_t)priceValue {
	NSNumber *result = [self price];
	return [result intValue];
}

- (void)setPriceValue:(int32_t)value_ {
	[self setPrice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result intValue];
}

- (void)setPrimitivePriceValue:(int32_t)value_ {
	[self setPrimitivePrice:[NSNumber numberWithInt:value_]];
}





@dynamic priority;



- (int16_t)priorityValue {
	NSNumber *result = [self priority];
	return [result shortValue];
}

- (void)setPriorityValue:(int16_t)value_ {
	[self setPriority:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePriorityValue {
	NSNumber *result = [self primitivePriority];
	return [result shortValue];
}

- (void)setPrimitivePriorityValue:(int16_t)value_ {
	[self setPrimitivePriority:[NSNumber numberWithShort:value_]];
}





@dynamic projectDescription;






@dynamic startDate;






@dynamic status;



- (int16_t)statusValue {
	NSNumber *result = [self status];
	return [result shortValue];
}

- (void)setStatusValue:(int16_t)value_ {
	[self setStatus:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveStatusValue {
	NSNumber *result = [self primitiveStatus];
	return [result shortValue];
}

- (void)setPrimitiveStatusValue:(int16_t)value_ {
	[self setPrimitiveStatus:[NSNumber numberWithShort:value_]];
}





@dynamic statusTime;






@dynamic timeframe;



- (int16_t)timeframeValue {
	NSNumber *result = [self timeframe];
	return [result shortValue];
}

- (void)setTimeframeValue:(int16_t)value_ {
	[self setTimeframe:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTimeframeValue {
	NSNumber *result = [self primitiveTimeframe];
	return [result shortValue];
}

- (void)setPrimitiveTimeframeValue:(int16_t)value_ {
	[self setPrimitiveTimeframe:[NSNumber numberWithShort:value_]];
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





@dynamic hasFeedback;

	

@dynamic hasTask;

	
- (NSMutableSet*)hasTaskSet {
	[self willAccessValueForKey:@"hasTask"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasTask"];
  
	[self didAccessValueForKey:@"hasTask"];
	return result;
}
	

@dynamic ofUser;

	






@end
