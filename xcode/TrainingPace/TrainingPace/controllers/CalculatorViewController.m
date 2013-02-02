//
//  CalculatorViewController.m
//  TrainingPace
//
//  Created by Ray Tran on 01/02/2013.
//  Copyright (c) 2013 Artran Ltd. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize distance_unit_choice = _distanceUnitChoice;
@synthesize pace_unit_choice = _paceUnitChoice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pace_unit_changed:(id)sender {
}

- (IBAction)calculate_pressed:(id)sender {
}
@end
