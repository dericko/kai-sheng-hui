// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHTask.m instead.

#import "_KSHTask.h"

const struct KSHTaskAttributes KSHTaskAttributes = {
	.createTime = @"createTime",
	.endTime = @"endTime",
	.listID = @"listID",
	.name = @"name",
	.notes = @"notes",
	.paid = @"paid",
	.startTime = @"startTime",
	.status = @"status",
	.statusTime = @"statusTime",
	.taskID = @"taskID",
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
	
	if ([key isEqualToString:@"listIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"listID"];
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
	if ([key isEqualToString:@"taskIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"taskID"];
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




@dynamic createTime;






@dynamic endTime;






@dynamic listID;



- (int32_t)listIDValue {
	NSNumber *result = [self listID];
	return [result intValue];
}

- (void)setListIDValue:(int32_t)value_ {
	[self setListID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveListIDValue {
	NSNumber *result = [self primitiveListID];
	return [result intValue];
}

- (void)setPrimitiveListIDValue:(int32_t)value_ {
	[self setPrimitiveListID:[NSNumber numberWithInt:value_]];
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






@dynamic taskID;



- (int32_t)taskIDValue {
	NSNumber *result = [self taskID];
	return [result intValue];
}

- (void)setTaskIDValue:(int32_t)value_ {
	[self setTaskID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTaskIDValue {
	NSNumber *result = [self primitiveTaskID];
	return [result intValue];
}

- (void)setPrimitiveTaskIDValue:(int32_t)value_ {
	[self setPrimitiveTaskID:[NSNumber numberWithInt:value_]];
}





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
