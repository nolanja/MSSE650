//
//  ExpenseItTests.m
//  ExpenseItTests
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TripSvcArchive.h"
#import "Trip.h"

@interface ExpenseItTests : XCTestCase

@end

@implementation ExpenseItTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTripSvcArchive {
    // This is test for the methods in the TripSvcArchive.
    NSLog(@"*** Starting testTripSvcArchive ***");
    TripSvcArchive *tripSvc = [[TripSvcArchive alloc] init];
    unsigned long initialCount = [[tripSvc retrieveAllTrips]count];
    
    Trip *trip = [[Trip alloc] init];
    trip.tripName = @"Trip 1";
    trip.startDate = @"12/1/2015";
    trip.endDate = @"12/7/2015";
    
    [tripSvc createTrip:(Trip *) trip];
    unsigned long finalCount = [[tripSvc retrieveAllTrips] count];
    
    XCTAssertEqual(initialCount +1, finalCount,  @"initial count %lu, final count %lu ", initialCount, finalCount);
    
    NSLog(@"*** Ending testContactSvcArchive ***");
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
