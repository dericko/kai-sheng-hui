// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProfile.m instead.

#import "_KSHProfile.h"

const struct KSHProfileAttributes KSHProfileAttributes = {
	.company = @"company",
	.createTime = @"createTime",
	.email = @"email",
	.firstName = @"firstName",
	.lastName = @"lastName",
	.mobile = @"mobile",
	.name = @"name",
	.nickname = @"nickname",
	.position = @"position",
};

const struct KSHProfileRelationships KSHProfileRelationships = {
	.user = @"user",
};

const struct KSHProfileFetchedProperties KSHProfileFetchedProperties = {
};

@implementation KSHProfileID
@end

@implementation _KSHProfile

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Profile";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Profile" inManagedObjectContext:moc_];
}

- (KSHProfileID*)objectID {
	return (KSHProfileID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic company;






@dynamic createTime;






@dynamic email;






@dynamic firstName;






@dynamic lastName;






@dynamic mobile;






@dynamic name;






@dynamic nickname;






@dynamic position;






@dynamic user;

	






@end
