// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProfile.m instead.

#import "_KSHProfile.h"

const struct KSHProfileAttributes KSHProfileAttributes = {
	.birthday = @"birthday",
	.company = @"company",
	.education = @"education",
	.firstName = @"firstName",
	.gender = @"gender",
	.industry = @"industry",
	.lastName = @"lastName",
	.mobile = @"mobile",
	.name = @"name",
	.nickname = @"nickname",
	.position = @"position",
	.profile = @"profile",
	.residence = @"residence",
	.specialty = @"specialty",
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
	
	if ([key isEqualToString:@"educationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"education"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"genderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gender"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"industryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"industry"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic birthday;






@dynamic company;






@dynamic education;



- (int16_t)educationValue {
	NSNumber *result = [self education];
	return [result shortValue];
}

- (void)setEducationValue:(int16_t)value_ {
	[self setEducation:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEducationValue {
	NSNumber *result = [self primitiveEducation];
	return [result shortValue];
}

- (void)setPrimitiveEducationValue:(int16_t)value_ {
	[self setPrimitiveEducation:[NSNumber numberWithShort:value_]];
}





@dynamic firstName;






@dynamic gender;



- (int16_t)genderValue {
	NSNumber *result = [self gender];
	return [result shortValue];
}

- (void)setGenderValue:(int16_t)value_ {
	[self setGender:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveGenderValue {
	NSNumber *result = [self primitiveGender];
	return [result shortValue];
}

- (void)setPrimitiveGenderValue:(int16_t)value_ {
	[self setPrimitiveGender:[NSNumber numberWithShort:value_]];
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





@dynamic lastName;






@dynamic mobile;






@dynamic name;






@dynamic nickname;






@dynamic position;






@dynamic profile;






@dynamic residence;






@dynamic specialty;






@dynamic user;

	






@end
