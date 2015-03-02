//
//  SecondViewController.m
//  ExpenseIt
//
//  Created by James Nolan on 2/1/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//
#import "TripSvcCoreData.h"
#import "SecondViewController.h"
#import "ViewController.h"
#import "Trip.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

TripSvcCoreData *mainTripSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainTripSvc = [[TripSvcCoreData alloc] init];
    [self.mainTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *) mainTableView numberOfRowsInSection:(NSInteger)section
{
    return [[mainTripSvc retrieveAllTrips] count];
}

- (UITableViewCell *)tableView:(UITableView *)mainTableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *mainSimpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell =
    [mainTableView dequeueReusableCellWithIdentifier:mainSimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainSimpleTableIdentifier];
    }
    Trip *trip = [[mainTripSvc retrieveAllTrips]objectAtIndex:indexPath.row];
    NSMutableString *desc = [NSMutableString stringWithFormat:@"%@ ",trip.tripName];
    [desc appendFormat:@"%@ ", trip.startDate];
    [desc appendFormat:@"%@ ", trip.endDate];
    cell.textLabel.text = desc;
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *startingViewController = (SecondViewController *)segue.sourceViewController;
    
    ViewController *destinationViewController = (ViewController *)segue.destinationViewController;
    
    startingViewController.currentTrip.text =
    destinationViewController.tripName.text;
    
    //startingViewController.mainTableView = destinationViewController.tableView;
    
}


@end
