// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHFeedback.m instead.

#import "_KSHFeedback.h"

const struct KSHFeedbackAttributes KSHFeedbackAttributes = {
	.comment = @"comment",
	.createTime = @"createTime",
	.feedbackID = @"feedbackID",
	.paymentScore = @"paymentScore",
	.qualityScore = @"qualityScore",
	.serviceScore = @"serviceScore",
	.willing = @"willing",
};

const struct KSHFeedbackRelationships KSHFeedbackRelationships = {
	.ofProject = @"ofProject",
};

const struct KSHFeedbackFetchedProperties KSHFeedbackFetchedProperties = {
};

@implementation KSHFeedbackID
@end

@implementation _KSHFeedback

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Feedback" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Feedback";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Feedback" inManagedObjectContext:moc_];
}

- (KSHFeedbackID*)objectID {
	return (KSHFeedbackID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"feedbackIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"feedbackID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"paymentScoreValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"paymentScore"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"qualityScoreValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"qualityScore"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"serviceScoreValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"serviceScore"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"willingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"willing"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic comment;






@dynamic createTime;






@dynamic feedbackID;



- (int32_t)feedbackIDValue {
	NSNumber *result = [self feedbackID];
	return [result intValue];
}

- (void)setFeedbackIDValue:(int32_t)value_ {
	[self setFeedbackID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFeedbackIDValue {
	NSNumber *result = [self primitiveFeedbackID];
	return [result intValue];
}

- (void)setPrimitiveFeedbackIDValue:(int32_t)value_ {
	[self setPrimitiveFeedbackID:[NSNumber numberWithInt:value_]];
}





@dynamic paymentScore;



- (int16_t)paymentScoreValue {
	NSNumber *result = [self paymentScore];
	return [result shortValue];
}

- (void)setPaymentScoreValue:(int16_t)value_ {
	[self setPaymentScore:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePaymentScoreValue {
	NSNumber *result = [self primitivePaymentScore];
	return [result shortValue];
}

- (void)setPrimitivePaymentScoreValue:(int16_t)value_ {
	[self setPrimitivePaymentScore:[NSNumber numberWithShort:value_]];
}





@dynamic qualityScore;



- (int16_t)qualityScoreValue {
	NSNumber *result = [self qualityScore];
	return [result shortValue];
}

- (void)setQualityScoreValue:(int16_t)value_ {
	[self setQualityScore:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveQualityScoreValue {
	NSNumber *result = [self primitiveQualityScore];
	return [result shortValue];
}

- (void)setPrimitiveQualityScoreValue:(int16_t)value_ {
	[self setPrimitiveQualityScore:[NSNumber numberWithShort:value_]];
}





@dynamic serviceScore;



- (int16_t)serviceScoreValue {
	NSNumber *result = [self serviceScore];
	return [result shortValue];
}

- (void)setServiceScoreValue:(int16_t)value_ {
	[self setServiceScore:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveServiceScoreValue {
	NSNumber *result = [self primitiveServiceScore];
	return [result shortValue];
}

- (void)setPrimitiveServiceScoreValue:(int16_t)value_ {
	[self setPrimitiveServiceScore:[NSNumber numberWithShort:value_]];
}





@dynamic willing;



- (BOOL)willingValue {
	NSNumber *result = [self willing];
	return [result boolValue];
}

- (void)setWillingValue:(BOOL)value_ {
	[self setWilling:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveWillingValue {
	NSNumber *result = [self primitiveWilling];
	return [result boolValue];
}

- (void)setPrimitiveWillingValue:(BOOL)value_ {
	[self setPrimitiveWilling:[NSNumber numberWithBool:value_]];
}





@dynamic ofProject;

	






@end
