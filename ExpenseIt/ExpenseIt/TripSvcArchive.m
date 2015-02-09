//
//  TripSvcArchive.m
//  ExpenseIt
//
//  Created by James Nolan on 2/8/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "TripSvcArchive.h"

@implementation TripSvcArchive

NSString *filePath;

NSMutableArray *trips;

-(id) init{
    NSArray *dirPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Trips.archive"]];
    [self readArchive];
    return self;
}

-(void) readArchive {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:filePath]) {
        trips = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    else
    {
        trips = [NSMutableArray array];
    }
    
}

-(void) writeArchive {
    [NSKeyedArchiver archiveRootObject:trips toFile:filePath];
}

-(Trip *) createTrip:(Trip *)trip
{
    NSLog(@"TripSvc.createTrip: %@", [trip description]);
    [trips addObject:trip];
    [self writeArchive];
    
    return trip;
}

-(NSMutableArray *)retrieveAllTrips
{
    return trips;
}

-(Trip *)updateTrip:(Trip *)trip
{
    return trip;
}

-(Trip *)deleteTrip:(Trip *)trip
{
    return trip;
}

@end
