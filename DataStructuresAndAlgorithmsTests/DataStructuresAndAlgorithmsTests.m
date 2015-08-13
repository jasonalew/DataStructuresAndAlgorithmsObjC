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

@interface DataStructuresAndAlgorithmsTests : XCTestCase

@end

@implementation DataStructuresAndAlgorithmsTests

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

- (void)testIsPrime {
    // Test the prime function
    XCTAssertTrue([JALMethods isPrime:11]);
    XCTAssertTrue([JALMethods isPrime:97]);
    XCTAssertFalse([JALMethods isPrime:100]);
    XCTAssertFalse([JALMethods isPrime:62]);
}

@end
