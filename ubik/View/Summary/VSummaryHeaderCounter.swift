import UIKit

class VSummaryHeaderCounter:UIView
{
    weak var labelValue:UILabel!
    weak var labelMaxValue:UILabel!
    private let numberFormatter:NSNumberFormatter
    private let kValueSize:CGFloat = 50
    private let kMaxValueSize:CGFloat = 20
    private let kLabelsTop:CGFloat = 20
    
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
        labelMaxValue.textColor = UIColor.main()
        self.labelMaxValue = labelMaxValue
        
        addSubview(labelValue)
        addSubview(labelMaxValue)
        
        let views:[String:AnyObject] = [
            "labelValue":labelValue,
            "labelMaxValue":labelMaxValue]
        
        let metrics:[String:AnyObject] = [
            "labelsTop":kLabelsTop]
        
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
            "V:|-(labelsTop)-[labelValue]-0-[labelMaxValue]",
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
        labelValue.text = stringValue
        labelMaxValue.text = stringMaxValue
    }
}