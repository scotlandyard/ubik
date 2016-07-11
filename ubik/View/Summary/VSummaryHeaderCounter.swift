import UIKit

class VSummaryHeaderCounter:UIView
{
    weak var labelValue:UILabel!
    weak var labelMaxValue:UILabel!
    private weak var layoutValueTop:NSLayoutConstraint!
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
            "V:[labelValue]-0-[labelMaxValue]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutValueTop = NSLayoutConstraint(
            item:labelValue,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutValueTop)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remain:CGFloat = height - kValueSize
        let margin:CGFloat = remain / 2.0
        let usableMargin:CGFloat = margin - kMaxValueSize
        layoutValueTop.constant = usableMargin
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