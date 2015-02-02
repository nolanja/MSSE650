//
//  SecondViewController.m
//  ExpenseIt
//
//  Created by James Nolan on 2/1/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "SecondViewController.h"
# import "ViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController * startingViewController = (SecondViewController *)segue.sourceViewController;
    
    ViewController *destinationViewController = (ViewController *)segue.destinationViewController;
    
    startingViewController.currentTrip.text =
    destinationViewController.tripName.text;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
