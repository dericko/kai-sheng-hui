// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProjectOpportunity.m instead.

#import "_KSHProjectOpportunity.h"

const struct KSHProjectOpportunityAttributes KSHProjectOpportunityAttributes = {
	.contacts = @"contacts",
	.deadlineDate = @"deadlineDate",
	.fetchableType = @"fetchableType",
	.idealBackground = @"idealBackground",
	.referenceContent = @"referenceContent",
	.title = @"title",
	.urlString = @"urlString",
};

const struct KSHProjectOpportunityRelationships KSHProjectOpportunityRelationships = {
};

const struct KSHProjectOpportunityFetchedProperties KSHProjectOpportunityFetchedProperties = {
};

@implementation KSHProjectOpportunityID
@end

@implementation _KSHProjectOpportunity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ProjectOpportunity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ProjectOpportunity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ProjectOpportunity" inManagedObjectContext:moc_];
}

- (KSHProjectOpportunityID*)objectID {
	return (KSHProjectOpportunityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"fetchableTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fetchableType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic contacts;






@dynamic deadlineDate;






@dynamic fetchableType;



- (int16_t)fetchableTypeValue {
	NSNumber *result = [self fetchableType];
	return [result shortValue];
}

- (void)setFetchableTypeValue:(int16_t)value_ {
	[self setFetchableType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFetchableTypeValue {
	NSNumber *result = [self primitiveFetchableType];
	return [result shortValue];
}

- (void)setPrimitiveFetchableTypeValue:(int16_t)value_ {
	[self setPrimitiveFetchableType:[NSNumber numberWithShort:value_]];
}





@dynamic idealBackground;






@dynamic referenceContent;






@dynamic title;






@dynamic urlString;











@end
