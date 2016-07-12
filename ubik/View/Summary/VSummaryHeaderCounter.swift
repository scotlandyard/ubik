import UIKit

class VSummaryHeaderCounter:UIView
{
    weak var labelValue:UILabel!
    weak var labelMaxValue:UILabel!
    private let numberFormatter:NSNumberFormatter
    private let kValueSize:CGFloat = 35
    private let kMaxValueSize:CGFloat = 14
    
    init()
    {
        numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelValue:UILabel = UILabel()
        labelValue.userInteractionEnabled = false
        labelValue.translatesAutoresizingMaskIntoConstraints = false
        labelValue.textAlignment = NSTextAlignment.Center
        labelValue.backgroundColor = UIColor.clearColor()
        labelValue.font = UIFont.numeric(kValueSize)
        labelValue.textColor = UIColor.main()
        self.labelValue = labelValue
        
        let labelMaxValue:UILabel = UILabel()
        labelMaxValue.userInteractionEnabled = false
        labelMaxValue.translatesAutoresizingMaskIntoConstraints = false
        labelMaxValue.textAlignment = NSTextAlignment.Center
        labelMaxValue.backgroundColor = UIColor.clearColor()
        labelMaxValue.font = UIFont.numeric(kMaxValueSize)
        labelMaxValue.textColor = UIColor(white:0.84, alpha:1)
        self.labelMaxValue = labelMaxValue
        
        addSubview(labelValue)
        addSubview(labelMaxValue)
        
        let views:[String:AnyObject] = [
            "labelValue":labelValue,
            "labelMaxValue":labelMaxValue]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelValue]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelMaxValue]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelValue]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-50-[labelMaxValue]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func update(value:CGFloat, maxValue:CGFloat)
    {
        let stringValue:String = numberFormatter.stringFromNumber(value)!
        let stringMaxValue:String = numberFormatter.stringFromNumber(maxValue)!
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.labelValue.text = stringValue
            self.labelMaxValue.text = stringMaxValue
        }
    }
}