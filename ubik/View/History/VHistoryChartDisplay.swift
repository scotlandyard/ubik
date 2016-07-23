import UIKit

class VHistoryChartDisplay:UIView
{
    weak var labelDate:UILabel!
    weak var labelAmount:UILabel!
    weak var labelMeasures:UILabel!
    weak var labelSteps:UILabel!
    weak var labelStepsTitle:UILabel!
    
    init()
    {
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelDate:UILabel = UILabel()
        labelDate.userInteractionEnabled = false
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.backgroundColor = UIColor.clearColor()
        labelDate.font = UIFont.regular(15)
        labelDate.textAlignment = NSTextAlignment.Center
        labelDate.textColor = UIColor.complementDarker()
        labelDate.numberOfLines = 0
        self.labelDate = labelDate
        
        let labelAmount:UILabel = UILabel()
        labelAmount.userInteractionEnabled = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.backgroundColor = UIColor.clearColor()
        labelAmount.font = UIFont.numeric(45)
        labelAmount.textAlignment = NSTextAlignment.Center
        labelAmount.textColor = UIColor.main()
        self.labelAmount = labelAmount
        
        let labelMeasures:UILabel = UILabel()
        labelMeasures.userInteractionEnabled = false
        labelMeasures.translatesAutoresizingMaskIntoConstraints = false
        labelMeasures.backgroundColor = UIColor.clearColor()
        labelMeasures.font = UIFont.regular(13)
        labelMeasures.textAlignment = NSTextAlignment.Center
        labelMeasures.textColor = UIColor.blackColor()
        labelMeasures.hidden = true
        self.labelMeasures = labelMeasures
        
        let labelSteps:UILabel = UILabel()
        labelSteps.userInteractionEnabled = false
        labelSteps.translatesAutoresizingMaskIntoConstraints = false
        labelSteps.backgroundColor = UIColor.clearColor()
        labelSteps.font = UIFont.numeric(38)
        labelSteps.textAlignment = NSTextAlignment.Center
        labelSteps.textColor = UIColor.main()
        self.labelSteps = labelSteps
        
        let labelStepsTitle:UILabel = UILabel()
        labelStepsTitle.userInteractionEnabled = false
        labelStepsTitle.translatesAutoresizingMaskIntoConstraints = false
        labelStepsTitle.backgroundColor = UIColor.clearColor()
        labelStepsTitle.font = UIFont.regular(13)
        labelStepsTitle.textAlignment = NSTextAlignment.Center
        labelStepsTitle.textColor = UIColor.blackColor()
        labelStepsTitle.hidden = true
        labelStepsTitle.text = NSLocalizedString("VHistoryChartDisplay_stepsTitle", comment:"")
        self.labelStepsTitle = labelStepsTitle
        
        addSubview(labelDate)
        addSubview(labelAmount)
        addSubview(labelMeasures)
        addSubview(labelSteps)
        addSubview(labelStepsTitle)
        
        let views:[String:AnyObject] = [
            "labelDate":labelDate,
            "labelAmount":labelAmount,
            "labelMeasures":labelMeasures,
            "labelSteps":labelSteps,
            "labelStepsTitle":labelStepsTitle]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[labelDate]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelAmount]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelMeasures]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelSteps]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelStepsTitle]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelDate(45)]-0-[labelAmount(65)]-(-12)-[labelMeasures(18)]-20-[labelSteps(55)]-(-5)-[labelStepsTitle(18)]",
            options:[],
            metrics:metrics,
            views:views))
        
        let stringMeasures:String
        
        switch MConfiguration.sharedInstance.device!.measures
        {
            case DUbikDevice.DUbikDeviceMeasures.Imperial:
                
                stringMeasures = NSLocalizedString("VHistoryChartDisplay_measuresImperial", comment:"")
                
                break
                
            case DUbikDevice.DUbikDeviceMeasures.Metric:
                
                stringMeasures = NSLocalizedString("VHistoryChartDisplay_measuresMetric", comment:"")
                
                break
        }
        
        labelMeasures.text = stringMeasures
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func hikeSelected(model:MHistoryItem)
    {
        labelDate.text = model.date
        labelAmount.text = model.distance
        labelSteps.text = model.steps
        labelMeasures.hidden = false
        labelStepsTitle.hidden = false
    }
}