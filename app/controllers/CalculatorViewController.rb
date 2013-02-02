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

  attr_accessor :calculate_button

  # iOS lifecycle methods
  def viewDidLoad
      super
      self.title = "Pace calculator"

      @window = UIApplication.sharedApplication.windows[0]
  end

  # segue methods
  def prepareForSegue(segue, sender:sender)
    if !@web_view
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
    @metric_pace = self.pace_unit_choice.selectedSegmentIndex == 0
    calculate_paces
  end

  def calculate_pressed(sender)
    if @window.firstResponder
      @window.firstResponder.resignFirstResponder
    end
    calculate_paces
  end

  ################ calculator implementation ################

  def calculate_paces
    @mins_taken = self.time_hours_field.text.to_i * 60 + self.time_mins_field.text.to_i + self.time_secs_field.text.to_i / 60.0
    @metres_raced = self.distance_field.text.to_f

    @metric_distance = self.distance_unit_choice.selectedSegmentIndex == 0
    if @metric_distance
      @metres_raced *= 1000
    else
      @metres_raced *= 1609
    end

    if @mins_taken > 0 && @metres_raced > 0
      @speed = @metres_raced / @mins_taken
      @vo2_max = vo2_for_velocity(@speed) / percent_vo2_max_for_time(@mins_taken)

      puts 'calculate'
      self.easy_pace_label.text = "#{@metres_raced}"
      self.tempo_pace_label.text = "#{@vo2_max}"
    end
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

    private
    # Takes a velocity im m/min and converts it to a VO2 level.
    def vo2_for_velocity(vel)
      if vel > 0
        (-4.60 + 0.182258 * vel + 0.000104 * vel * vel)
      else
        0.0
      end
    end

    # Takes a VO2 measurement and converts it to a velocity in m/min.
    def velocity_for_vo2(vo2)
      if vo2 > 0
        (29.54 + 5.000663 * vo2 - 0.007546 * vo2 * vo2)
      else
        0.0
      end
    end

    # Takes a time in minutes and converts it to a percent of VO2 maximum.
    def percent_vo2_max_for_time(minutes)
      if minutes > 0
        (0.8 + 0.1894393 * Math.exp(-0.012778 * minutes) + 0.2989558 * Math.exp(-0.1932695 * minutes))
      else
        0.0
      end
    end
end
