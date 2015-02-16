//
//  TripSvcSQLite.m
//  ExpenseIt
//
//  Created by James Nolan on 2/15/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "TripSvcSQLite.h"
#import "sqlite3.h"

@implementation TripSvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;


-(id)init {
    if ((self = [super init])) {
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"expenseIt.sqlite3"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            NSLog(@"database is open");
            NSLog(@"database file path: %@", databasePath);
            
            NSString *createSql= @"create table if not exists trip (id integer primary key autoincrement, tripName varchar(30), startDate varchar(20), endDate varchar(20))";
            char *errMsg;
            if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg) != SQLITE_OK) {
                NSLog(@"Failed to create table %s", errMsg);
            }
        }
        else
        {
            NSLog(@"*** Faile to open database!");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
    }
    return self;
}

- (Trip *) createTrip:(Trip *)trip
{
    sqlite3_stmt *statement;
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO trip (tripName, startDate, endDate) VALUES (\"%@\", \"%@\", \"%@\")", trip.tripName, trip.startDate, trip.endDate];
    if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            trip.id = sqlite3_last_insert_rowid(database);
            NSLog(@"*** Trip added***");
        }
        else {
            NSLog(@"*** Trip NOT added");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return trip;
}

- (NSMutableArray *) retrieveAllTrips {
    NSMutableArray *trips = [NSMutableArray array];
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM trip ORDER BY tripName"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"*** Trips retrieved ***");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int id = sqlite3_column_int(statement, 0);
            char *tripNameChars = (char *)sqlite3_column_text(statement, 1);
            char *startDateChars = (char *)sqlite3_column_text(statement, 2);
            char *endDateChars  = (char *)sqlite3_column_text(statement, 3);
            
            Trip *trip = [[Trip alloc] init];
            trip.id = id;
            trip.tripName = [[NSString alloc] initWithUTF8String:tripNameChars];
            trip.startDate = [[NSString alloc] initWithUTF8String:startDateChars];
            trip.endDate = [[NSString alloc] initWithUTF8String:endDateChars];
            [trips addObject:trip];
        }
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"*** Trips NOT retrieved ***");
        NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
    }
    return trips;
}

- (Trip *) updateTrip:(Trip *)trip {
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE trip SET tripName=\"%@\", startDate=\"%@\", endDate=\"%@\" WHERE id = %i ", trip.tripName, trip.startDate, trip.endDate, trip.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Trip updated ***");
        }
        else {
            NSLog(@"*** Trip NOT updated ***");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return trip;
}

- (Trip *) deleteTrip:(Trip *)trip
{
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM trip WHERE id = %i ", trip.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"*** Trip deleted ***");
        }
        else {
            NSLog(@"*** Contact NOT deleted ***");
            NSLog(@"*** SQL error: %s\n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return trip;
}

- (void)dealloc {
    sqlite3_close(database);
}


@end
