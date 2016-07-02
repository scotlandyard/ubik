import UIKit

class VSummaryHeader:UIView
{
    weak var controller:CSummary!
    weak var viewGyro:VComponentGyro!
    var modelGyro:MComponentGyro = MComponentGyro.Summary()
    private let kMargin:CGFloat = 10
    
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
        
        let metrics:[String:AnyObject] = [
            "margin":kMargin]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(margin)-[gyro]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(margin)-[gyro]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}
