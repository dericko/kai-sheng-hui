// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultationTask.m instead.

#import "_KSHConsultationTask.h"

const struct KSHConsultationTaskAttributes KSHConsultationTaskAttributes = {
	.approved = @"approved",
	.clientID = @"clientID",
	.contactID = @"contactID",
	.industry = @"industry",
	.interviewType = @"interviewType",
	.position = @"position",
};

const struct KSHConsultationTaskRelationships KSHConsultationTaskRelationships = {
};

const struct KSHConsultationTaskFetchedProperties KSHConsultationTaskFetchedProperties = {
};

@implementation KSHConsultationTaskID
@end

@implementation _KSHConsultationTask

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ConsultationTask" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ConsultationTask";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ConsultationTask" inManagedObjectContext:moc_];
}

- (KSHConsultationTaskID*)objectID {
	return (KSHConsultationTaskID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"approvedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"approved"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"clientIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"clientID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"contactIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"contactID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industry"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"interviewTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"interviewType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"positionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"position"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic approved;



- (BOOL)approvedValue {
	NSNumber *result = [self approved];
	return [result boolValue];
}

- (void)setApprovedValue:(BOOL)value_ {
	[self setApproved:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveApprovedValue {
	NSNumber *result = [self primitiveApproved];
	return [result boolValue];
}

- (void)setPrimitiveApprovedValue:(BOOL)value_ {
	[self setPrimitiveApproved:[NSNumber numberWithBool:value_]];
}





@dynamic clientID;



- (int32_t)clientIDValue {
	NSNumber *result = [self clientID];
	return [result intValue];
}

- (void)setClientIDValue:(int32_t)value_ {
	[self setClientID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveClientIDValue {
	NSNumber *result = [self primitiveClientID];
	return [result intValue];
}

- (void)setPrimitiveClientIDValue:(int32_t)value_ {
	[self setPrimitiveClientID:[NSNumber numberWithInt:value_]];
}





@dynamic contactID;



- (int32_t)contactIDValue {
	NSNumber *result = [self contactID];
	return [result intValue];
}

- (void)setContactIDValue:(int32_t)value_ {
	[self setContactID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveContactIDValue {
	NSNumber *result = [self primitiveContactID];
	return [result intValue];
}

- (void)setPrimitiveContactIDValue:(int32_t)value_ {
	[self setPrimitiveContactID:[NSNumber numberWithInt:value_]];
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





@dynamic interviewType;



- (int16_t)interviewTypeValue {
	NSNumber *result = [self interviewType];
	return [result shortValue];
}

- (void)setInterviewTypeValue:(int16_t)value_ {
	[self setInterviewType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveInterviewTypeValue {
	NSNumber *result = [self primitiveInterviewType];
	return [result shortValue];
}

- (void)setPrimitiveInterviewTypeValue:(int16_t)value_ {
	[self setPrimitiveInterviewType:[NSNumber numberWithShort:value_]];
}





@dynamic position;



- (int32_t)positionValue {
	NSNumber *result = [self position];
	return [result intValue];
}

- (void)setPositionValue:(int32_t)value_ {
	[self setPosition:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePositionValue {
	NSNumber *result = [self primitivePosition];
	return [result intValue];
}

- (void)setPrimitivePositionValue:(int32_t)value_ {
	[self setPrimitivePosition:[NSNumber numberWithInt:value_]];
}










@end
