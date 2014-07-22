// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProject.m instead.

#import "_KSHProject.h"

const struct KSHProjectAttributes KSHProjectAttributes = {
	.categoryID = @"categoryID",
	.createTime = @"createTime",
	.currencyUnit = @"currencyUnit",
	.endTime = @"endTime",
	.industryID = @"industryID",
	.name = @"name",
	.price = @"price",
	.priority = @"priority",
	.projectDescription = @"projectDescription",
	.projectID = @"projectID",
	.startTime = @"startTime",
	.status = @"status",
	.statusTime = @"statusTime",
	.timeframe = @"timeframe",
	.type = @"type",
	.updateTime = @"updateTime",
};

const struct KSHProjectRelationships KSHProjectRelationships = {
	.hasFeedback = @"hasFeedback",
	.hasTask = @"hasTask",
	.ofConsultant = @"ofConsultant",
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
	
	if ([key isEqualToString:@"categoryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"categoryID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industryID"];
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
	if ([key isEqualToString:@"projectIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"projectID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"statusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"status"];
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




@dynamic categoryID;



- (int16_t)categoryIDValue {
	NSNumber *result = [self categoryID];
	return [result shortValue];
}

- (void)setCategoryIDValue:(int16_t)value_ {
	[self setCategoryID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCategoryIDValue {
	NSNumber *result = [self primitiveCategoryID];
	return [result shortValue];
}

- (void)setPrimitiveCategoryIDValue:(int16_t)value_ {
	[self setPrimitiveCategoryID:[NSNumber numberWithShort:value_]];
}





@dynamic createTime;






@dynamic currencyUnit;






@dynamic endTime;






@dynamic industryID;



- (int32_t)industryIDValue {
	NSNumber *result = [self industryID];
	return [result intValue];
}

- (void)setIndustryIDValue:(int32_t)value_ {
	[self setIndustryID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveIndustryIDValue {
	NSNumber *result = [self primitiveIndustryID];
	return [result intValue];
}

- (void)setPrimitiveIndustryIDValue:(int32_t)value_ {
	[self setPrimitiveIndustryID:[NSNumber numberWithInt:value_]];
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






@dynamic projectID;



- (int32_t)projectIDValue {
	NSNumber *result = [self projectID];
	return [result intValue];
}

- (void)setProjectIDValue:(int32_t)value_ {
	[self setProjectID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveProjectIDValue {
	NSNumber *result = [self primitiveProjectID];
	return [result intValue];
}

- (void)setPrimitiveProjectIDValue:(int32_t)value_ {
	[self setPrimitiveProjectID:[NSNumber numberWithInt:value_]];
}





@dynamic startTime;






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





@dynamic updateTime;






@dynamic hasFeedback;

	

@dynamic hasTask;

	
- (NSMutableSet*)hasTaskSet {
	[self willAccessValueForKey:@"hasTask"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasTask"];
  
	[self didAccessValueForKey:@"hasTask"];
	return result;
}
	

@dynamic ofConsultant;

	






@end
