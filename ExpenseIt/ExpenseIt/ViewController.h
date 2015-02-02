//
//  ViewController.h
//  ExpenseIt
//
//  Created by James Nolan on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *tripName;
@property (weak, nonatomic) IBOutlet UITextField *startDate;
@property (weak, nonatomic) IBOutlet UITextField *endDate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)saveTrip:(id)sender;
- (IBAction)cancelTrip:(id)sender;

@end

