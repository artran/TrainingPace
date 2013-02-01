class CalculatorViewController < UIViewController
    def viewDidLoad
        super

        self.view.backgroundColor = UIColor.whiteColor
        self.title = "Training pace calculator"

        input_labels = ["Length of race:", "Time (h:m:s):", "Pace units:"]
        input_labels.each_with_index do |text, index|
            label = UILabel.alloc.initWithFrame([[20, index * 45 + 31],[120, 21]])
            label.text = text
            self.view.addSubview(label)
        end

        @distance_field = UITextField.alloc.initWithFrame([[142, 26], [40, 31]])
        @distance_field.borderStyle = UITextBorderStyleRoundedRect
        @distance_field.textAlignment = UITextAlignmentLeft
        @distance_field.keyboardType = UIKeyboardTypeDecimalPad
        self.view.addSubview(@distance_field)

        # distance unit switch
        #@pace_unit_switch = UISegmentedControl.alloc.initWithFrame([[190, 20], [110, 44]])
        @pace_unit_switch = UISegmentedControl.alloc.initWithItems(["km", "miles"])
        @pace_unit_switch.frame = [[190, 20], [110, 44]]
        @pace_unit_switch.selectedSegmentIndex = 0
        self.view.addSubview(@pace_unit_switch)

        # hour field
        # minute field
        # second field

        # pace unit switch

        # calculate button 20, 107

        output_labels = ["Easy run training pace:", "Tempo run training pace:",
                        "VO2-max training pace:", "Speed form training pace:",
                        "Long run training pace:", "Yasso 800 training pace:"]
        output_labels.each_with_index do |text, index|
            label = UILabel.alloc.initWithFrame([[20, index * 29 + 180],[195, 21]])
            label.text = text
            self.view.addSubview(label)
        end

        output_value_labels = ["@easyValueLabel", "@tempoValueLabel", "@vo2ValueLabel",
                             "@speedFormValueLabel", "@longRunValueLabel", "@yassoValueLabel"]
        output_value_labels.each_with_index do |label_name, index|
            output_value_label = UILabel.alloc.initWithFrame([[224, index * 29 + 180],[195, 21]])
            output_value_label.text = "00:00"
            self.view.addSubview(output_value_label)
            instance_variable_set(label_name, output_value_label)
        end

        # explain button 20, 354
    end
end
