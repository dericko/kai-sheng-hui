// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultant.m instead.

#import "_KSHConsultant.h"

const struct KSHConsultantAttributes KSHConsultantAttributes = {
	.birthday = @"birthday",
	.education = @"education",
	.gender = @"gender",
	.industry = @"industry",
	.profile = @"profile",
	.residence = @"residence",
	.specialty = @"specialty",
};

const struct KSHConsultantRelationships KSHConsultantRelationships = {
	.hasProject = @"hasProject",
	.hasProjectOpportunity = @"hasProjectOpportunity",
};

const struct KSHConsultantFetchedProperties KSHConsultantFetchedProperties = {
};

@implementation KSHConsultantID
@end

@implementation _KSHConsultant

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Consultant" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Consultant";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Consultant" inManagedObjectContext:moc_];
}

- (KSHConsultantID*)objectID {
	return (KSHConsultantID*)[super objectID];
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



- (int32_t)industryValue {
	NSNumber *result = [self industry];
	return [result intValue];
}

- (void)setIndustryValue:(int32_t)value_ {
	[self setIndustry:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveIndustryValue {
	NSNumber *result = [self primitiveIndustry];
	return [result intValue];
}

- (void)setPrimitiveIndustryValue:(int32_t)value_ {
	[self setPrimitiveIndustry:[NSNumber numberWithInt:value_]];
}





@dynamic profile;






@dynamic residence;






@dynamic specialty;






@dynamic hasProject;

	
- (NSMutableSet*)hasProjectSet {
	[self willAccessValueForKey:@"hasProject"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasProject"];
  
	[self didAccessValueForKey:@"hasProject"];
	return result;
}
	

@dynamic hasProjectOpportunity;

	
- (NSMutableSet*)hasProjectOpportunitySet {
	[self willAccessValueForKey:@"hasProjectOpportunity"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"hasProjectOpportunity"];
  
	[self didAccessValueForKey:@"hasProjectOpportunity"];
	return result;
}
	






@end
