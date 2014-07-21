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
#import <CoreData+MagicalRecord.h>
#import <MagicalRecord.h>

@interface KSHMappingProviderTest : XCTestCase

@end

@implementation KSHMappingProviderTest

- (void)setupClass
{
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class
    NSBundle *testTargetBundle = [NSBundle bundleWithIdentifier:@"com.Capvision.KaiShengHuiTests"];
    [RKTestFixture setFixtureBundle:testTargetBundle];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)tearDownClass
{
    [MagicalRecord
}

- (RKEntityMapping *)articleMapping
{
    RKEntityMapping *articleMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [articleMapping addAttributeMappingsFromDictionary:@{
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

- (void)testMappingOfTitle
{
    id parsedJSON = [RKTestFixture parsedObjectWithContentsOfFixture:@"article.json"];
    RKMappingTest *test = [RKMappingTest testForMapping:[self articleMapping] sourceObject:parsedJSON destinationObject:nil];
    [test addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"article.title" destinationKeyPath:@"title"]];
    XCTAssertTrue([test evaluate], @"The title has not been set up!");
}

@end
