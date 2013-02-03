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

      self.distance_field.delegate = self
      self.time_hours_field.delegate = self
      self.time_mins_field.delegate = self
      self.time_secs_field.delegate = self
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
    calculate_pressed sender
  end

  def calculate_pressed(sender)
    if @window.firstResponder
      @window.firstResponder.resignFirstResponder
    end
    calculate_paces
  end

  # UITextFieldDelegate methods
  def textField(text_field, shouldChangeCharactersInRange: range, replacementString: replacement_string)
    starts_with_zero = (replacement_string.start_with?('0') && range.location == 0 && range.length == 0)
    if starts_with_zero
      return false
    end

    if text_field == distance_field
      return ! /[^0-9.]+/.match(replacement_string)
    else
      return ! /[^0-9]+/.match(replacement_string)
    end
  end

  ################ calculator implementation ################

  def calculate_paces
    mins_taken = self.time_hours_field.text.to_i * 60 + self.time_mins_field.text.to_i + self.time_secs_field.text.to_i / 60.0
    metres_raced = self.distance_field.text.to_f

    metric_distance = self.distance_unit_choice.selectedSegmentIndex == 0
    if metric_distance
      metres_raced *= 1000
    else
      metres_raced *= 1609
    end

    if mins_taken > 0 && metres_raced > 0
      speed = metres_raced / mins_taken
      vo2_max = vo2_for_velocity(speed) / percent_vo2_max_for_time(mins_taken)

      vel_easy = velocity_for_vo2(vo2_max * 0.7)
      vel_tempo = velocity_for_vo2(vo2_max * 0.88)
      vel_vo2 = velocity_for_vo2(vo2_max)
      vel_speed = velocity_for_vo2(vo2_max * 1.1)
      vel_long = velocity_for_vo2(vo2_max * 0.6)
      vel_yasso = vel_vo2 * 1.95

      metric_pace = self.pace_unit_choice.selectedSegmentIndex == 0

      suffix = metric_pace ? 'min/km' : 'min/mi'

      self.easy_pace_label.text = "%s #{suffix}" % pace_for_speed(vel_easy, metric_pace)
      self.tempo_pace_label.text = "%s #{suffix}" % pace_for_speed(vel_tempo, metric_pace)
      self.vo2_pace_label.text = "%s #{suffix}" % pace_for_speed(vel_vo2, metric_pace)
      self.speed_pace_label.text = "%s #{suffix}" % pace_for_speed(vel_speed, metric_pace)
      self.long_pace_label.text = "%s #{suffix}" % pace_for_speed(vel_long, metric_pace)
        
      # BOOL oldMetricPace = self.metricPace;
      # self.metricPace = NO;
      # self.yassoPaceLabel.text = [NSString stringWithFormat:@"%@ min/800", [self paceForSpeed:velYasso]];
      # self.metricPace = oldMetricPace;
    end
  end

  private
  
  # Takes a speed in metres / minute a converts it to a string representing a pace in
  # minutes per mile or km.
  def pace_for_speed(speed, metric_pace)
    factor = metric_pace ? 1000 : 1609
    speed = 1.0 / speed * factor
      
    minutes = speed.floor
    seconds = ((speed - minutes) * 60).floor

    "%i : %s%i" % [minutes, (seconds > 9 ? '' : '0'), seconds]
  end

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
