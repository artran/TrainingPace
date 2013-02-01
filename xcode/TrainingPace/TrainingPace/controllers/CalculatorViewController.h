//
//  CalculatorViewController.h
//  TrainingPace
//
//  Created by Ray Tran on 01/02/2013.
//  Copyright (c) 2013 Artran Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitChoice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *paceUnitChoice;

- (IBAction)paceUnitChanged:(id)sender;
- (IBAction)calculatePressed:(id)sender;
@end
