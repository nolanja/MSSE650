//
//  TripSvcCache.m
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "TripSvcCache.h"

@implementation TripSvcCache

NSMutableArray *trips = nil;

- (id) init {
    if (self = [super init]) {
        trips = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Trip *) createTrip:(Trip *)trip {
    [trips addObject: trip];
    return trip;
}

- (NSMutableArray *) retrieveAllTrips{
    return trips;
}

- (Trip *) updateTrip:(Trip *)trip {
    return trip;
}

- (Trip *) deleteTrip:(Trip *)trip {
    return trip;
}

@end
