// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KSHProjectOpportunity.m instead.

#import "_KSHProjectOpportunity.h"

const struct KSHProjectOpportunityAttributes KSHProjectOpportunityAttributes = {
	.contacts = @"contacts",
	.deadlineDate = @"deadlineDate",
	.idealBackground = @"idealBackground",
	.opportunityID = @"opportunityID",
	.publishDate = @"publishDate",
	.referenceContent = @"referenceContent",
	.title = @"title",
};

const struct KSHProjectOpportunityRelationships KSHProjectOpportunityRelationships = {
	.ofConsultant = @"ofConsultant",
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
	
	if ([key isEqualToString:@"opportunityIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"opportunityID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic contacts;






@dynamic deadlineDate;






@dynamic idealBackground;






@dynamic opportunityID;



- (int32_t)opportunityIDValue {
	NSNumber *result = [self opportunityID];
	return [result intValue];
}

- (void)setOpportunityIDValue:(int32_t)value_ {
	[self setOpportunityID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOpportunityIDValue {
	NSNumber *result = [self primitiveOpportunityID];
	return [result intValue];
}

- (void)setPrimitiveOpportunityIDValue:(int32_t)value_ {
	[self setPrimitiveOpportunityID:[NSNumber numberWithInt:value_]];
}





@dynamic publishDate;






@dynamic referenceContent;






@dynamic title;






@dynamic ofConsultant;

	
- (NSMutableSet*)ofConsultantSet {
	[self willAccessValueForKey:@"ofConsultant"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"ofConsultant"];
  
	[self didAccessValueForKey:@"ofConsultant"];
	return result;
}
	






@end
