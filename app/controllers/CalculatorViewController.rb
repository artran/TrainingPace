class CalculatorViewController < UIViewController
    def viewDidLoad
        super

        self.view.backgroundColor = UIColor.whiteColor
        self.title = "Training pace calculator"

        distanceLabel = UILabel.alloc.initWithFrame([[20, 20],[195, 21]])
        distanceLabel.text = "Length of recent race:"
        self.view.addSubview(distanceLabel)

        # distanceField
        # distance unit switch

        @durationLabel = UILabel.alloc.initWithFrame([[20, 49],[195, 21]])
        @durationLabel.text = "Time taken (h:m:s):"
        self.view.addSubview(@durationLabel)

        # hour field
        # minute field
        # second field

        @unitLabel = UILabel.alloc.initWithFrame([[20, 78],[195, 21]])
        @unitLabel.text = "Display paces in:"
        self.view.addSubview(@unitLabel)

        # pace unit switch

        # calculate button 20, 107

        @easyLabel = UILabel.alloc.initWithFrame([[20, 180],[195, 21]])
        @easyLabel.text = "Easy run training pace:"
        self.view.addSubview(@easyLabel )

        @easyValueLabel = UILabel.alloc.initWithFrame([[224, 180],[195, 21]])
        @easyValueLabel.text = "00:00"
        self.view.addSubview(@easyValueLabel )

        @tempoLabel = UILabel.alloc.initWithFrame([[20, 209],[195, 21]])
        @tempoLabel.text = "Tempo run training pace:"
        self.view.addSubview(@tempoLabel)

        @tempoValueLabel = UILabel.alloc.initWithFrame([[224, 209],[195, 21]])
        @tempoValueLabel.text = "00:00"
        self.view.addSubview(@tempoValueLabel )

        @vo2Label = UILabel.alloc.initWithFrame([[20, 238],[195, 21]])
        @vo2Label.text = "VO2-max training pace:"
        self.view.addSubview(@vo2Label )

        @vo2ValueLabel = UILabel.alloc.initWithFrame([[224, 238],[195, 21]])
        @vo2ValueLabel.text = "00:00"
        self.view.addSubview(@vo2ValueLabel )

        @speedFormLabel = UILabel.alloc.initWithFrame([[20, 267],[195, 21]])
        @speedFormLabel.text = "Speed form training pace:"
        self.view.addSubview(@speedFormLabel )

        @speedFormValueLabel = UILabel.alloc.initWithFrame([[224, 267],[195, 21]])
        @speedFormValueLabel.text = "00:00"
        self.view.addSubview(@speedFormValueLabel )

        @longRunLabel = UILabel.alloc.initWithFrame([[20, 296],[195, 21]])
        @longRunLabel.text = "Long run training pace:"
        self.view.addSubview(@longRunLabel )

        @longRunValueLabel = UILabel.alloc.initWithFrame([[224, 296],[195, 21]])
        @longRunValueLabel.text = "00:00"
        self.view.addSubview(@longRunValueLabel )

        @yassoLabel = UILabel.alloc.initWithFrame([[20, 325],[195, 21]])
        @yassoLabel.text = "Yasso 800 training pace:"
        self.view.addSubview(@yassoLabel )

        @yassoValueLabel = UILabel.alloc.initWithFrame([[224, 325],[195, 21]])
        @yassoValueLabel.text = "00:00"
        self.view.addSubview(@yassoValueLabel )

        # explain button 20, 354
    end
end
