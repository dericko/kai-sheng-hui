// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTask.m instead.

#import "_KSHTask.h"

const struct KSHTaskAttributes KSHTaskAttributes = {
	.endDate = @"endDate",
	.fetchableType = @"fetchableType",
	.list = @"list",
	.name = @"name",
	.notes = @"notes",
	.paid = @"paid",
	.startDate = @"startDate",
	.status = @"status",
	.statusTime = @"statusTime",
	.timezone = @"timezone",
};

const struct KSHTaskRelationships KSHTaskRelationships = {
	.ofProject = @"ofProject",
};

const struct KSHTaskFetchedProperties KSHTaskFetchedProperties = {
};

@implementation KSHTaskID
@end

@implementation _KSHTask

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Task";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Task" inManagedObjectContext:moc_];
}

- (KSHTaskID*)objectID {
	return (KSHTaskID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"fetchableTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fetchableType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"listValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"list"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"paidValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"statusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"status"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timezoneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timezone"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




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





@dynamic list;



- (int32_t)listValue {
	NSNumber *result = [self list];
	return [result intValue];
}

- (void)setListValue:(int32_t)value_ {
	[self setList:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveListValue {
	NSNumber *result = [self primitiveList];
	return [result intValue];
}

- (void)setPrimitiveListValue:(int32_t)value_ {
	[self setPrimitiveList:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic notes;






@dynamic paid;



- (BOOL)paidValue {
	NSNumber *result = [self paid];
	return [result boolValue];
}

- (void)setPaidValue:(BOOL)value_ {
	[self setPaid:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePaidValue {
	NSNumber *result = [self primitivePaid];
	return [result boolValue];
}

- (void)setPrimitivePaidValue:(BOOL)value_ {
	[self setPrimitivePaid:[NSNumber numberWithBool:value_]];
}





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






@dynamic timezone;



- (int16_t)timezoneValue {
	NSNumber *result = [self timezone];
	return [result shortValue];
}

- (void)setTimezoneValue:(int16_t)value_ {
	[self setTimezone:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTimezoneValue {
	NSNumber *result = [self primitiveTimezone];
	return [result shortValue];
}

- (void)setPrimitiveTimezoneValue:(int16_t)value_ {
	[self setPrimitiveTimezone:[NSNumber numberWithShort:value_]];
}





@dynamic ofProject;

	






@end
