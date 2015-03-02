//
//  TripSvcCoreData.m
//  ExpenseIt
//
//  Created by James Nolan on 2/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "TripSvcCoreData.h"
#import "CoreData/CoreData.h"

@implementation TripSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;


- (void) initializeCoreData
{
    //initialize and load the shema model
    NSURL *modelURL = [[NSBundle mainBundle]
                      URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
    
    //initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask]lastObject];
    
    NSURL *storeURL =[applicationDocumentsDirectory URLByAppendingPathComponent:@"expenseIt.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        // initialize the managed obect context
        moc = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    }
    else{
        NSLog(@"initalizeCoreData FAILED with error: %@", error);
    }
}

-(id) init {
    if (self  = [super init])
    {
        [self initializeCoreData];
        return self;
    }
    
    return nil;
}

- (Trip *) createManagedTrip {
    Trip *trip = [NSEntityDescription insertNewObjectForEntityForName:@"Trip" inManagedObjectContext:moc];
    return trip;
}



- (Trip *) createTrip: (Trip *) trip
  {
      Trip *managedTrip = [self createManagedTrip];
      managedTrip.tripName = trip.tripName;
      managedTrip.startDate = trip.startDate;
      managedTrip.endDate = trip.endDate;
      
      NSError *error;
      if (![moc save:&error]) {
          NSLog(@"createTrip ERROR: %@", [error localizedDescription]);
      }
      
      return managedTrip;
  }

- (NSArray *) retrieveAllTrips
  {
      NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
      NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trip"  inManagedObjectContext:moc];
      [fetchRequest setEntity:entity];
      
      NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"tripName" ascending:YES];
      
      [fetchRequest setSortDescriptors:@[sortDescriptor]];
      
      NSError *error;
      NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
      
      return fetchedObjects;
  }

- (Trip *) updateTrip:(Trip *)trip
  {
      NSError *error;
      
      if (![moc save:&error]) {
          NSLog(@"updateTrip ERROR: %@", [error localizedDescription]);
      }
      return trip;
  }

- (Trip *)deleteTrip:(Trip *)trip
  {
      [moc deleteObject:trip];
      return trip;
  }
    


@end
