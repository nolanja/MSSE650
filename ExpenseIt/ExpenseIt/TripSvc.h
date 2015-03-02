//
//  TripSvc.h
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Trip.h"

@protocol TripSvc <NSObject>

- (Trip *) createTrip: (Trip *) trip;
- (NSArray *) retrieveAllTrips;
- (Trip *) updateTrip: (Trip *) trip;
- (Trip *) deleteTrip: (Trip *) trip;

@end
