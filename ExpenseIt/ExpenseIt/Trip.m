//
//  Trip.m
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "Trip.h"

@implementation Trip

- (NSString *) description{
    return [NSString stringWithFormat:@"%@ %@ %@", _tripName, _startDate, _endDate];
}

@end
