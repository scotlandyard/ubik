import UIKit

class VSummaryHeaderCounter:UIView
{
    weak var model:MComponentGyro!
    weak var labelValue:UILabel!
    weak var labelMaxValue:UILabel!
    weak var spinner:VMainLoader?
    weak var timer:NSTimer?
    private var deltaCounter:CGFloat
    private var currentCounter:CGFloat
    private var expectedCounter:CGFloat
    private let kTimeInterval:NSTimeInterval = 0.02
    private let kAnimationRepetitions:CGFloat = 50
    private let numberFormatter:NSNumberFormatter
    private let kValueSize:CGFloat = 35
    private let kMaxValueSize:CGFloat = 14
    
    init(model:MComponentGyro)
    {
        self.model = model
        numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        currentCounter = 0
        deltaCounter = 0
        expectedCounter = 0
        
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
        timer?.invalidate()
        spinner?.stopAnimating()
    }
    
    func tick(sender timer:NSTimer)
    {
        currentCounter += deltaCounter
        
        if deltaCounter > 0
        {
            if currentCounter > expectedCounter
            {
                currentCounter = expectedCounter
                
                timer.invalidate()
            }
        }
        else
        {
            if currentCounter < expectedCounter
            {
                currentCounter = expectedCounter
                
                timer.invalidate()
            }
        }
        
        printCount()
    }
    
    //MARK: private
    
    private func printCount()
    {
        let stringValue:String = numberFormatter.stringFromNumber(currentCounter)!
        labelValue.text = stringValue
    }
    
    //MARK: public
    
    func update()
    {
        timer?.invalidate()
        let stringMaxValue:String = numberFormatter.stringFromNumber(model.maxValue)!
        expectedCounter = model.value
        deltaCounter = floor((expectedCounter - currentCounter) / kAnimationRepetitions)
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            if self != nil
            {
                self!.spinner?.stopAnimating()
                self!.spinner?.removeFromSuperview()
                self!.labelMaxValue.text = stringMaxValue
                
                if self!.deltaCounter != 0
                {
                    self!.timer = NSTimer.scheduledTimerWithTimeInterval(self!.kTimeInterval, target:self!, selector:#selector(self!.tick(sender:)), userInfo:nil, repeats:true)
                }
            }
        }
    }
}