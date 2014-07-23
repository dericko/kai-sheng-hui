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
#import "KSHMappingProvider.h"
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
    NSBundle *testTargetBundle = [NSBundle bundleWithIdentifier:@"com.Capvision.KaiShengHuiTests"];
    [RKTestFixture setFixtureBundle:testTargetBundle];
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

- (void)testArticleMapping
{
    // Test the object
    id parsedJSON = [RKTestFixture parsedObjectWithContentsOfFixture:@"article.json"];
    RKMappingTest *test = [RKMappingTest testForMapping:[KSHMappingProvider articleMapping] sourceObject:parsedJSON destinationObject:nil];
    [test addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"title" destinationKeyPath:@"title"]];
    XCTAssertTrue([test evaluate], @"The title has not been set up!");
}

@end
