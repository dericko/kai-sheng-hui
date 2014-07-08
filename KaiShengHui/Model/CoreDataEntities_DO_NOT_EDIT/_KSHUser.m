// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.m instead.

#import "_KSHUser.h"

const struct KSHUserAttributes KSHUserAttributes = {
	.email = @"email",
	.firstName = @"firstName",
	.function = @"function",
	.functionID = @"functionID",
	.imgFile = @"imgFile",
	.imgURLString = @"imgURLString",
	.industry = @"industry",
	.industryID = @"industryID",
	.lastLoginDate = @"lastLoginDate",
	.lastName = @"lastName",
	.signupDate = @"signupDate",
	.userID = @"userID",
	.username = @"username",
};

const struct KSHUserRelationships KSHUserRelationships = {
	.dislikes = @"dislikes",
	.likes = @"likes",
};

const struct KSHUserFetchedProperties KSHUserFetchedProperties = {
};

@implementation KSHUserID
@end

@implementation _KSHUser

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (KSHUserID*)objectID {
	return (KSHUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"functionIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"functionID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industryID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"userIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic email;






@dynamic firstName;






@dynamic function;






@dynamic functionID;



- (int32_t)functionIDValue {
	NSNumber *result = [self functionID];
	return [result intValue];
}

- (void)setFunctionIDValue:(int32_t)value_ {
	[self setFunctionID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFunctionIDValue {
	NSNumber *result = [self primitiveFunctionID];
	return [result intValue];
}

- (void)setPrimitiveFunctionIDValue:(int32_t)value_ {
	[self setPrimitiveFunctionID:[NSNumber numberWithInt:value_]];
}





@dynamic imgFile;






@dynamic imgURLString;






@dynamic industry;






@dynamic industryID;



- (int16_t)industryIDValue {
	NSNumber *result = [self industryID];
	return [result shortValue];
}

- (void)setIndustryIDValue:(int16_t)value_ {
	[self setIndustryID:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIndustryIDValue {
	NSNumber *result = [self primitiveIndustryID];
	return [result shortValue];
}

- (void)setPrimitiveIndustryIDValue:(int16_t)value_ {
	[self setPrimitiveIndustryID:[NSNumber numberWithShort:value_]];
}





@dynamic lastLoginDate;






@dynamic lastName;






@dynamic signupDate;






@dynamic userID;



- (int32_t)userIDValue {
	NSNumber *result = [self userID];
	return [result intValue];
}

- (void)setUserIDValue:(int32_t)value_ {
	[self setUserID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUserIDValue {
	NSNumber *result = [self primitiveUserID];
	return [result intValue];
}

- (void)setPrimitiveUserIDValue:(int32_t)value_ {
	[self setPrimitiveUserID:[NSNumber numberWithInt:value_]];
}





@dynamic username;






@dynamic dislikes;

	
- (NSMutableSet*)dislikesSet {
	[self willAccessValueForKey:@"dislikes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"dislikes"];
  
	[self didAccessValueForKey:@"dislikes"];
	return result;
}
	

@dynamic likes;

	
- (NSMutableSet*)likesSet {
	[self willAccessValueForKey:@"likes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"likes"];
  
	[self didAccessValueForKey:@"likes"];
	return result;
}
	






@end
