//
//  Trip.h
//  ExpenseIt
//
//  Created by James Nolan on 2/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trip : NSManagedObject 

@property (nonatomic, retain) NSString * tripName;
@property (nonatomic, retain) NSString * startDate;
@property (nonatomic, retain) NSString * endDate;

@end
