// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHLoginRequest.m instead.

#import "_KSHLoginRequest.h"

const struct KSHLoginRequestAttributes KSHLoginRequestAttributes = {
	.email = @"email",
	.password = @"password",
	.sessionID = @"sessionID",
};

const struct KSHLoginRequestRelationships KSHLoginRequestRelationships = {
};

const struct KSHLoginRequestFetchedProperties KSHLoginRequestFetchedProperties = {
};

@implementation KSHLoginRequestID
@end

@implementation _KSHLoginRequest

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LoginRequest" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LoginRequest";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LoginRequest" inManagedObjectContext:moc_];
}

- (KSHLoginRequestID*)objectID {
	return (KSHLoginRequestID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"sessionIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sessionID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic email;






@dynamic password;






@dynamic sessionID;



- (int32_t)sessionIDValue {
	NSNumber *result = [self sessionID];
	return [result intValue];
}

- (void)setSessionIDValue:(int32_t)value_ {
	[self setSessionID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSessionIDValue {
	NSNumber *result = [self primitiveSessionID];
	return [result intValue];
}

- (void)setPrimitiveSessionIDValue:(int32_t)value_ {
	[self setPrimitiveSessionID:[NSNumber numberWithInt:value_]];
}










@end
