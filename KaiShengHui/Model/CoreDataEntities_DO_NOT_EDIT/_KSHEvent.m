// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHEvent.m instead.

#import "_KSHEvent.h"

const struct KSHEventAttributes KSHEventAttributes = {
	.chargeType = @"chargeType",
	.contactEmail = @"contactEmail",
	.contactName = @"contactName",
	.contactTelephone = @"contactTelephone",
	.endTime = @"endTime",
	.eventID = @"eventID",
	.eventURLString = @"eventURLString",
	.memberPrice = @"memberPrice",
	.mustApply = @"mustApply",
	.nonmemberPrice = @"nonmemberPrice",
	.place = @"place",
	.region = @"region",
	.startTime = @"startTime",
	.type = @"type",
};

const struct KSHEventRelationships KSHEventRelationships = {
};

const struct KSHEventFetchedProperties KSHEventFetchedProperties = {
};

@implementation KSHEventID
@end

@implementation _KSHEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (KSHEventID*)objectID {
	return (KSHEventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"chargeTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"chargeType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"eventIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"eventID"];
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




@dynamic chargeType;



- (int16_t)chargeTypeValue {
	NSNumber *result = [self chargeType];
	return [result shortValue];
}

- (void)setChargeTypeValue:(int16_t)value_ {
	[self setChargeType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveChargeTypeValue {
	NSNumber *result = [self primitiveChargeType];
	return [result shortValue];
}

- (void)setPrimitiveChargeTypeValue:(int16_t)value_ {
	[self setPrimitiveChargeType:[NSNumber numberWithShort:value_]];
}





@dynamic contactEmail;






@dynamic contactName;






@dynamic contactTelephone;






@dynamic endTime;






@dynamic eventID;



- (int32_t)eventIDValue {
	NSNumber *result = [self eventID];
	return [result intValue];
}

- (void)setEventIDValue:(int32_t)value_ {
	[self setEventID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEventIDValue {
	NSNumber *result = [self primitiveEventID];
	return [result intValue];
}

- (void)setPrimitiveEventIDValue:(int32_t)value_ {
	[self setPrimitiveEventID:[NSNumber numberWithInt:value_]];
}





@dynamic eventURLString;






@dynamic memberPrice;






@dynamic mustApply;






@dynamic nonmemberPrice;






@dynamic place;






@dynamic region;






@dynamic startTime;






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










@end