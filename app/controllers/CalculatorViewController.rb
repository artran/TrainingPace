class CalculatorViewController < UIViewController
  # Outlets
  attr_accessor :distance_unit_choice
  attr_accessor :pace_unit_choice
  attr_accessor :distance_field
  attr_accessor :time_hours_field
  attr_accessor :time_mins_field
  attr_accessor :time_secs_field

  attr_accessor :easy_pace_label
  attr_accessor :tempo_pace_label
  attr_accessor :vo2_pace_label
  attr_accessor :speed_pace_label
  attr_accessor :long_pace_label
  
  # iOS lifecycle methods
  def viewDidLoad
      super
  end
  
  # segue methods
  def prepareForSegue(segue, sender:sender)
    if !@web_view then
      @web_view = UIWebView.alloc.init
      path = NSBundle.mainBundle.pathForResource('explainPaceCalculator', ofType: 'html')
      url = NSURL.fileURLWithPath(path)
      @web_view.loadRequest NSURLRequest.requestWithURL(url)
    end
    
    destination = segue.destinationViewController
    destination.setTitle("Explain Pace Calculator")
    destination.setView(@web_view)
  end
  
  # Actions
  def pace_unit_changed(sender)
    self.metric_pace = self.pace_unit_choice.selectedSegmentIndex == 0
    calculate_paces
  end
  
  def calculate_pressed(sender)
    self.easy_pace_label.text = '1:23'
  end
  
  ################ calculator implementation ################

  def setup_calculation
       #   self.minsTaken = [self.timeTakenHrsEditor.text floatValue] * 60
       #      + [self.timeTakenMinsEditor.text floatValue]
       #      + [self.timeTakenSecsEditor.text floatValue] /60;
       #    
       #      self.metresRaced = [self.distanceEditor.text floatValue];
       #    
       #      self.metricDistance = (self.distanceUnitChoice.selectedSegmentIndex == 0);
       #    
       #      if (self.metricDistance) {
       #          self.metresRaced *= 1000;
       #      } else {
       #          self.metresRaced *= 1609;
       #      }
       #    
       #      self.speed = self.metresRaced / self.minsTaken;
       #    
       #      self.vo2Max = [RunCalcMaths vo2ForVelocity:self.speed] / [RunCalcMaths percentVO2MaxForTime:self.minsTaken];
       #    
       #      [self calculatePaces];
  end

  def calculate_paces
        # float velEasy = [RunCalcMaths velocityForVO2:(self.vo2Max * .7)];
        # float velTempo = [RunCalcMaths velocityForVO2:(self.vo2Max * .88)];
        # float velVo2 = [RunCalcMaths velocityForVO2:(self.vo2Max)];
        # float velSpeed = [RunCalcMaths velocityForVO2:(self.vo2Max * 1.1)];
        # float velLong = [RunCalcMaths velocityForVO2:(self.vo2Max * .6)];
        # float velYasso = velVo2 * 1.95;  
        #     
        # NSString *toAppend;
        # self.metricPace = (self.paceUnitChoice.selectedSegmentIndex == 0);
        # if (self.metricPace) {
        #     toAppend = @" min/km";
        # } else {
        #     toAppend = @" min/mile";
        # }
        #     
        # self.easyPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velEasy], toAppend];
        # self.tempoPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velTempo], toAppend];
        # self.vo2PaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velVo2], toAppend];
        # self.speedPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velSpeed], toAppend];
        # self.longPaceLabel.text = [NSString stringWithFormat:@"%@ %@", [self paceForSpeed:velLong], toAppend];
        # 
        # BOOL oldMetricPace = self.metricPace;
        # self.metricPace = NO;
        # self.yassoPaceLabel.text = [NSString stringWithFormat:@"%@ min/800", [self paceForSpeed:velYasso]];
        # self.metricPace = oldMetricPace;
    end

  # Takes a speed in metres / minute a converts it to a string representing a pace in
  # minutes per mile or km.   
  def pace_for_speed(speed)
      # float factor = (self.metricPace ? 1000 : 1609);
      # speed = 1 / speed * factor;
      #     
      # int minutes = floor(speed);
      # int seconds = floor((speed - minutes) * 60);
      #     
      # return [NSString stringWithFormat:@"%i : %@%i", minutes, (seconds > 9 ? @"" : @"0"), seconds];
    end
end
