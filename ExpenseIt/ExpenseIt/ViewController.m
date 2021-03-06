//
//  ViewController.m
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Trip.h"
#import "TripSvcCoreData.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

TripSvcCoreData *tripSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tripSvc = [[TripSvcCoreData alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (IBAction)saveTrip:(id)sender {
    NSLog(@"saveTrip: entering");
    [self.view endEditing:YES];
    Trip *trip = [tripSvc createManagedTrip];
    trip.tripName = _tripName.text;
    trip.startDate = _startDate.text;
    trip.endDate = _endDate.text;
    [tripSvc createTrip:trip];
    [self.tableView reloadData];
    NSLog(@"saveTrip: trip saved");
}

- (IBAction)cancelTrip:(id)sender {
    NSLog(@"cancelTrip");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tripSvc retrieveAllTrips] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Trip *trip = [[tripSvc retrieveAllTrips]objectAtIndex:indexPath.row];
    NSMutableString *desc = [NSMutableString stringWithFormat:@"%@ ",trip.tripName];
    [desc appendFormat:@"%@ ", trip.startDate];
     [desc appendFormat:@"%@ ", trip.endDate];
    cell.textLabel.text = desc;
    return cell;
}
@end
