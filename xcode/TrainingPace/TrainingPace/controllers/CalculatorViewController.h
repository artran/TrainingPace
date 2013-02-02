//
//  CalculatorViewController.h
//  TrainingPace
//
//  Created by Ray Tran on 01/02/2013.
//  Copyright (c) 2013 Artran Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *distance_unit_choice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pace_unit_choice;
@property (weak, nonatomic) IBOutlet UITextField *distance_field;
@property (weak, nonatomic) IBOutlet UITextField *time_hours_field;
@property (weak, nonatomic) IBOutlet UITextField *time_mins_field;
@property (weak, nonatomic) IBOutlet UITextField *time_secs_field;

@property (weak, nonatomic) IBOutlet UILabel *easy_pace_label;
@property (weak, nonatomic) IBOutlet UILabel *tempo_pace_label;
@property (weak, nonatomic) IBOutlet UILabel *vo2_pace_label;
@property (weak, nonatomic) IBOutlet UILabel *speed_pace_label;
@property (weak, nonatomic) IBOutlet UILabel *long_pace_label;

@property (weak, nonatomic) IBOutlet UIButton *calculate_button;

- (IBAction)pace_unit_changed:(id)sender;
- (IBAction)calculate_pressed:(id)sender;
@end
