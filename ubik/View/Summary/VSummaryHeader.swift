import UIKit

class VSummaryHeader:UIView
{
    weak var controller:CSummary!
    weak var viewGyro:VComponentGyro?
    weak var viewGyroIcon:VComponentGyroIcon!
    var modelGyro:MComponentGyro = MComponentGyro.Summary()
    private let kMargin:CGFloat = 20
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewGyroBase:VComponentGyroBase = VComponentGyroBase(model:modelGyro)
        let viewGyroIcon:VComponentGyroIcon = VComponentGyroIcon(model:modelGyro)
        self.viewGyroIcon = viewGyroIcon
        
        addSubview(viewGyroBase)
        addSubview(viewGyroIcon)
        
        let views:[String:AnyObject] = [
            "gyroIcon":viewGyroIcon,
            "gyroBase":viewGyroBase]
        
        let metrics:[String:AnyObject] = [
            "margin":kMargin]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(margin)-[gyroBase]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(margin)-[gyroBase]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(margin)-[gyroIcon]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(margin)-[gyroIcon]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: public
    
    func update(value:CGFloat, maxValue:CGFloat)
    {
        modelGyro.update(value, maxValue:maxValue)
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.viewGyro?.removeFromSuperview()
            let viewGyro:VComponentGyro = VComponentGyro(model:self.modelGyro)
            self.viewGyro = viewGyro
            
            self.insertSubview(viewGyro, belowSubview:self.viewGyroIcon)
            
            let views:[String:AnyObject] = [
                "gyro":viewGyro]
            
            let metrics:[String:AnyObject] = [
                "margin":self.kMargin]
            
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-(margin)-[gyro]-(margin)-|",
                options:[],
                metrics:metrics,
                views:views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-(margin)-[gyro]-(margin)-|",
                options:[],
                metrics:metrics,
                views:views))
        }
    }
}
