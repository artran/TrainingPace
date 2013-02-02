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
  
  # Actions
  def pace_unit_changed(sender)
  end
  
  def calculate_pressed(sender)
    self.easy_pace_label.text = '1:23'
  end
end
