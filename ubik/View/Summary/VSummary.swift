import UIKit

class VSummary:UIView
{
    weak var controller:CSummary!
    weak var header:VSummaryHeader!
    var modelGyro:MComponentGyro = MComponentGyro.Summary()
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let header:VSummaryHeader = VSummaryHeader(controller:controller)
        self.header = header
        
        addSubview(header)
        
        let views:[String:AnyObject] = [
            "header":header]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[header]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[header(350)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: public
    
    func update(value:Int32, maxValue:Int32)
    {
        let floatValue:CGFloat = CGFloat(value)
        let floatMaxValue:CGFloat = CGFloat(maxValue)
        
        header.update(floatValue, maxValue:floatMaxValue)
    }
}