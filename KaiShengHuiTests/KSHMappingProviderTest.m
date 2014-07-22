//
//  KSHMappingProviderTest.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/21/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RestKit/RestKit.h>
#import <RestKit/Testing.h>
#import "KSHArticle.h"

@interface KSHMappingProviderTest : XCTestCase
@property (nonatomic, strong) RKManagedObjectStore *managedObjectStore;
@property (nonatomic, strong) KSHArticle *article;
@end

@implementation KSHMappingProviderTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class
    [RKTestFactory setUp];
//    
//    self.managedObjectStore = [RKTestFactory managedObjectStore];
//        NSError *error = nil;
//    [self.managedObjectStore addInMemoryPersistentStore:&error];
//    [self.managedObjectStore createManagedObjectContexts];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [RKTestFactory tearDown];
}

- (RKEntityMapping *)articleMapping
{
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:self.managedObjectStore];
    [self.articleMapping addAttributeMappingsFromDictionary:@{
                                                         @"id":              @"articleID",
                                                         @"title":           @"title",
                                                         @"excerpt":         @"excerpt",
                                                         @"tags":            @"tags",
                                                         @"content":         @"content",
                                                         @"editor":          @"author",
                                                         @"publish_time":    @"datePublished",
                                                         @"update_time":     @"dateUpdated",
                                                         @"type":            @"typeID",
                                                         @"view_count":      @"viewCount",
                                                         @"industry.id":     @"industryID",
                                                         @"function.id":     @"functionID",
                                                         @"function.value":  @"function",
                                                         @"file.path":       @"imgURLString"}];
    articleMapping.identificationAttributes = @[ @"articleID" ];
    
    return articleMapping;
}

- (void)testArticleMapping
{
    // Test the object
    id parsedJSON = [RKTestFixture parsedObjectWithContentsOfFixture:@"article.json"];
    RKMappingTest *test = [RKMappingTest testForMapping:[self articleMapping] sourceObject:parsedJSON destinationObject:nil];
    [test addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"title" destinationKeyPath:@"title"]];
    XCTAssertTrue([test evaluate], @"The title has not been set up!");
}

- (void)testObjectIdentification
{
    RKManagedObjectStore *managedObjectStore = [RKTestFactory managedObjectStore];
    NSError *error = nil;
    [managedObjectStore addInMemoryPersistentStore:&error];
    [managedObjectStore createManagedObjectContexts];
    
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:managedObjectStore];
    entityMapping.identificationAttributes = @[ @"articleID" ];
    [entityMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":      @"articleID",
                                                        @"title":   @"title"
                                                        }];
    NSDictionary *articleRepresentation = @{ @"id": @1234, @"title": @"The Title" };
    RKMappingTest *mappingTest = [RKMappingTest testForMapping:entityMapping sourceObject:articleRepresentation destinationObject:nil];
    
    // Configure Core Data
    mappingTest.managedObjectContext = managedObjectStore.persistentStoreManagedObjectContext;
    
    // Create an object to match our criteria
    NSManagedObject *article = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
    [article setValue:@(1234) forKey:@"articleID"];
    
    // Let the test perform the mapping
    [mappingTest performMapping];
    
    XCTAssertEqualObjects(article, mappingTest.destinationObject, @"Expected to match the Article, but did not");
}

@end
