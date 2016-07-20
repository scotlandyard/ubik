import UIKit

class VHistoryChartDisplay:UIView
{
    weak var labelDate:UILabel!
    weak var labelAmount:UILabel!
    weak var labelMeasures:UILabel!
    
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
        labelDate.font = UIFont.regular(20)
        labelDate.textAlignment = NSTextAlignment.Center
        labelDate.textColor = UIColor(white:0.7, alpha:1)
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
        labelMeasures.font = UIFont.regular(16)
        labelMeasures.textAlignment = NSTextAlignment.Center
        labelMeasures.textColor = UIColor(white:0.2, alpha:1)
        labelMeasures.hidden = true
        self.labelMeasures = labelMeasures
        
        addSubview(labelDate)
        addSubview(labelAmount)
        addSubview(labelMeasures)
        
        let views:[String:AnyObject] = [
            "labelDate":labelDate,
            "labelAmount":labelAmount,
            "labelMeasures":labelMeasures]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelDate]-0-|",
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
            "V:|-30-[labelDate(24)]-10-[labelAmount(65)]-(-12)-[labelMeasures(22)]",
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
        labelAmount.text = model.amount
        labelMeasures.hidden = false
    }
}