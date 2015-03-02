//
//  ExpenseItTests.m
//  ExpenseItTests
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Trip.h"
#import "TripSvcCoreData.h"

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

- (void)testTripSvcCoreData {
    // This is an example of a functional test case.
    NSLog(@" ");
   NSLog(@"** Starting testTripSvcCoreData ***");
    
    XCTAssert(YES, @"Pass");
    
   TripSvcCoreData *tripSvc= [[TripSvcCoreData alloc] init];
    Trip *trip = [tripSvc createTrip:trip];
   trip.tripName = @"Trip 1";
   trip.startDate = @"12/01/2014";
    trip.endDate = @"12/08/2014";
    [tripSvc createTrip:trip];
    
  NSArray *trips = [tripSvc retrieveAllTrips];
   NSLog(@"*** number of trips: %lu", trips.count);

  trip.tripName = @"Trip 1";
  trip.startDate = @"12/06/2014";
   trip.endDate = @"12/12/2014";
  [tripSvc updateTrip:trip];
    
   [tripSvc deleteTrip:trip];
    

   NSLog(@"*** Ending testTripSvcCoreData ***");
    NSLog(@" ");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
