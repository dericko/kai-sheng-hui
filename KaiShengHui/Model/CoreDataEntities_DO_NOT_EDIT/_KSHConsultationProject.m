// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHConsultationProject.m instead.

#import "_KSHConsultationProject.h"

const struct KSHConsultationProjectAttributes KSHConsultationProjectAttributes = {
	.location = @"location",
	.revealClientName = @"revealClientName",
};

const struct KSHConsultationProjectRelationships KSHConsultationProjectRelationships = {
};

const struct KSHConsultationProjectFetchedProperties KSHConsultationProjectFetchedProperties = {
};

@implementation KSHConsultationProjectID
@end

@implementation _KSHConsultationProject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ConsultationProject" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ConsultationProject";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ConsultationProject" inManagedObjectContext:moc_];
}

- (KSHConsultationProjectID*)objectID {
	return (KSHConsultationProjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"revealClientNameValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"revealClientName"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic location;






@dynamic revealClientName;



- (int16_t)revealClientNameValue {
	NSNumber *result = [self revealClientName];
	return [result shortValue];
}

- (void)setRevealClientNameValue:(int16_t)value_ {
	[self setRevealClientName:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRevealClientNameValue {
	NSNumber *result = [self primitiveRevealClientName];
	return [result shortValue];
}

- (void)setPrimitiveRevealClientNameValue:(int16_t)value_ {
	[self setPrimitiveRevealClientName:[NSNumber numberWithShort:value_]];
}










@end
