//
//  DataStructuresAndAlgorithmsTests.m
//  DataStructuresAndAlgorithmsTests
//
//  Created by Jason Lew on 8/13/15.
//  Copyright (c) 2015 Jason Lew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JALMethods.h"
#import "JALBinarySearch.h"
#import "JALLog.h"

@interface DataStructuresAndAlgorithmsTests : XCTestCase

@end

@implementation DataStructuresAndAlgorithmsTests

- (void)testIsPrime {
    // Test the prime function
    XCTAssertTrue([JALMethods isPrime:11]);
    XCTAssertTrue([JALMethods isPrime:97]);
    XCTAssertFalse([JALMethods isPrime:100]);
    XCTAssertFalse([JALMethods isPrime:62]);
}

- (void)testBinarySearchWithStrings {
    // Insert items in a sorted array
    NSMutableArray *orderedArray = [NSMutableArray arrayWithObjects:@"apple", @"bee", @"cat", @"zebra", nil];
    NSArray *comparisonArray = @[@"apple", @"bee", @"cat", @"dog", @"mouse", @"zebra"];
    
    [JALBinarySearch insertItem:@"mouse" sortedMutableArray:&orderedArray];
    [JALBinarySearch insertItem:@"dog" sortedMutableArray:&orderedArray];
    
    XCTAssertTrue([[orderedArray copy] isEqualToArray:comparisonArray], @"Arrays are not equal");
    
    // Just do a simple search
    XCTAssertFalse([JALBinarySearch findItem:@"fish" sortedArray:orderedArray], @"Search did not return false");
    XCTAssertTrue([JALBinarySearch findItem:@"dog" sortedArray:orderedArray], @"Search did not return true");
}

- (void)testBinarySearchWithNumbers {
    NSMutableArray *intOrderedArray = [NSMutableArray arrayWithObjects:@5, @9, @13, @56, @89, nil];
    NSArray *intOrderedComparisonArray = @[@5, @9, @11, @13, @56, @74, @89];
    
    [JALBinarySearch insertItem:@11 sortedMutableArray:&intOrderedArray];
    [JALBinarySearch insertItem:@74 sortedMutableArray:&intOrderedArray];
    
    XCTAssertTrue([[intOrderedArray copy] isEqualToArray:intOrderedComparisonArray], @"Arrays are not equal");
    
    // Simulate starting with an empty array and keeping it sorted as items are added.
    NSArray *unorderedIntArray = @[@22, @12, @56, @89, @7, @45, @67, @9, @288, @134, @33, @356];
    NSArray *orderedComparisonIntArray = @[@7, @9, @12, @22, @33, @45, @56, @67, @89, @134, @288, @356];
    NSMutableArray *newOrderedArray = [[NSMutableArray alloc]init];
    for (NSNumber *item in unorderedIntArray) {
        [JALBinarySearch insertItem:item sortedMutableArray:&newOrderedArray];
    }
    
    XCTAssertTrue([[newOrderedArray copy] isEqualToArray:orderedComparisonIntArray], @"Arrays are not equal");
}

//- (void)setUp {
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}
//
//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
