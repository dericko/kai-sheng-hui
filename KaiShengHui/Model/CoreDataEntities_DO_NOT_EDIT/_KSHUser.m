// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.m instead.

#import "_KSHUser.h"

const struct KSHUserAttributes KSHUserAttributes = {
	.currentUser = @"currentUser",
	.token = @"token",
	.userID = @"userID",
	.username = @"username",
};

const struct KSHUserRelationships KSHUserRelationships = {
	.dislikes = @"dislikes",
	.favorites = @"favorites",
	.likes = @"likes",
	.userProfile = @"userProfile",
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
	
	if ([key isEqualToString:@"currentUserValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"currentUser"];
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




@dynamic currentUser;



- (BOOL)currentUserValue {
	NSNumber *result = [self currentUser];
	return [result boolValue];
}

- (void)setCurrentUserValue:(BOOL)value_ {
	[self setCurrentUser:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCurrentUserValue {
	NSNumber *result = [self primitiveCurrentUser];
	return [result boolValue];
}

- (void)setPrimitiveCurrentUserValue:(BOOL)value_ {
	[self setPrimitiveCurrentUser:[NSNumber numberWithBool:value_]];
}





@dynamic token;






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
	

@dynamic favorites;

	
- (NSMutableSet*)favoritesSet {
	[self willAccessValueForKey:@"favorites"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"favorites"];
  
	[self didAccessValueForKey:@"favorites"];
	return result;
}
	

@dynamic likes;

	
- (NSMutableSet*)likesSet {
	[self willAccessValueForKey:@"likes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"likes"];
  
	[self didAccessValueForKey:@"likes"];
	return result;
}
	

@dynamic userProfile;

	






@end
