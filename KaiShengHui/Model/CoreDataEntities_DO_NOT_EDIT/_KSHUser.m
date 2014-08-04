// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHUser.m instead.

#import "_KSHUser.h"

const struct KSHUserAttributes KSHUserAttributes = {
	.createDate = @"createDate",
	.email = @"email",
	.token = @"token",
	.updateDate = @"updateDate",
	.userID = @"userID",
	.username = @"username",
};

const struct KSHUserRelationships KSHUserRelationships = {
	.favorites = @"favorites",
	.hasProject = @"hasProject",
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
	

	return keyPaths;
}




@dynamic createDate;






@dynamic email;






@dynamic token;






@dynamic updateDate;






@dynamic userID;






@dynamic username;






@dynamic favorites;

	
- (NSMutableSet*)favoritesSet {
	[self willAccessValueForKey:@"favorites"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"favorites"];
  
	[self didAccessValueForKey:@"favorites"];
	return result;
}
	

@dynamic hasProject;

	
- (NSMutableSet*)hasProjectSet {
	[self willAccessValueForKey:@"hasProject"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasProject"];
  
	[self didAccessValueForKey:@"hasProject"];
	return result;
}
	

@dynamic userProfile;

	






@end
