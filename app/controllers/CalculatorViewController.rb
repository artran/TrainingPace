class CalculatorViewController < UIViewController
    def viewDidLoad
        super

        self.view.backgroundColor = UIColor.whiteColor
        self.title = "Training pace calculator"

        inputLabels = ["Length of recent race:", "Time taken (h:m:s):", "Display paces in:"]
        inputLabels.each_with_index do |text, index|
            label = UILabel.alloc.initWithFrame([[20, index * 29 + 20],[195, 21]])
            label.text = text
            self.view.addSubview(label)
        end

        # distanceField
        # distance unit switch

        # hour field
        # minute field
        # second field

        # pace unit switch

        # calculate button 20, 107

        outputLabels = ["Easy run training pace:", "Tempo run training pace:",
                        "VO2-max training pace:", "Speed form training pace:",
                        "Long run training pace:", "Yasso 800 training pace:"]
        outputLabels.each_with_index do |text, index|
            label = UILabel.alloc.initWithFrame([[20, index * 29 + 180],[195, 21]])
            label.text = text
            self.view.addSubview(label)
        end

        outputValueLabels = ["@easyValueLabel", "@tempoValueLabel", "@vo2ValueLabel",
                             "@speedFormValueLabel", "@longRunValueLabel", "@yassoValueLabel"]
        outputValueLabels.each_with_index do |labelName, index|
            outputValueLabel = UILabel.alloc.initWithFrame([[224, index * 29 + 180],[195, 21]])
            outputValueLabel.text = "00:00"
            self.view.addSubview(outputValueLabel)
            instance_variable_set(labelName, outputValueLabel)
        end

        # explain button 20, 354
    end
end
