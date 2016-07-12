import UIKit

class VSummaryHeaderCounter:UIView
{
    weak var modelGyro:MComponentGyro!
    weak var labelValue:UILabel!
    weak var labelMaxValue:UILabel!
    weak var spinner:VMainLoader?
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
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        addSubview(labelValue)
        addSubview(labelMaxValue)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "labelValue":labelValue,
            "labelMaxValue":labelMaxValue,
            "spinner":spinner]
        
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    deinit
    {
        spinner?.stopAnimating()
    }
    
    //MARK: public
    
    func update(modelGyro:MComponentGyro)
    {
        self.modelGyro = modelGyro
        let stringValue:String = numberFormatter.stringFromNumber(modelGyro.value)!
        let stringMaxValue:String = numberFormatter.stringFromNumber(modelGyro.maxValue)!
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.spinner?.stopAnimating()
            self?.spinner?.removeFromSuperview()
            self?.labelValue.text = stringValue
            self?.labelMaxValue.text = stringMaxValue
        }
    }
}