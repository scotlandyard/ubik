import UIKit

class VSummaryHeader:UIView
{
    weak var controller:CSummary!
    weak var viewGyro:VComponentGyro!
    var modelGyro:MComponentGyro = MComponentGyro.Summary(0, maxValue:0)
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewGyro:VComponentGyro = VComponentGyro(model:modelGyro)
        self.viewGyro = viewGyro
        
        addSubview(viewGyro)
        
        let views:[String:AnyObject] = [
            "gyro":viewGyro]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[gyro]-20-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[gyro]-20-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}
