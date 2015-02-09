//
//  Trip.m
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "Trip.h"

static NSString *const TRIPNAME = @"tripName";
static NSString *const STARTDATE = @"startDate";
static NSString *const ENDDATE = @"endDate";

@implementation Trip

- (NSString *) description{
    return [NSString stringWithFormat:@"%@ %@ %@", _tripName, _startDate, _endDate];
}

- (void) encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.tripName forKey:TRIPNAME];
    [coder encodeObject:self.startDate forKey:STARTDATE];
    [coder encodeObject:self.endDate forKey:ENDDATE];
}

-(id)initWithCoder:(NSCoder *)coder{
    self=[super init];
    if (self) {
        _tripName = [coder decodeObjectForKey:TRIPNAME];
        _startDate = [coder decodeObjectForKey:STARTDATE];
        _endDate = [coder decodeObjectForKey:ENDDATE];
    }
    return self;
}

@end
