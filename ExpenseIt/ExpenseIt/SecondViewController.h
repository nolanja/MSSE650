//
//  SecondViewController.h
//  ExpenseIt
//
//  Created by James Nolan on 2/1/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *currentTrip;


@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end
