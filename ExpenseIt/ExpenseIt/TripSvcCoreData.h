//
//  TripSvcCoreData.h
//  ExpenseIt
//
//  Created by James Nolan on 2/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TripSvc.h"

@interface TripSvcCoreData : NSObject <TripSvc>

- (Trip *) createManagedTrip;

@end
