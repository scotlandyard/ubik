import UIKit

class VSummaryHeader:UIView
{
    weak var controller:CSummary!
    weak var viewGyro:VComponentGyro!
    weak var viewGyroIcon:VComponentGyroIcon!
    weak var counter:VSummaryHeaderCounter!
    var modelGyro:MComponentGyro = MComponentGyro.Summary()
    private let kMargin:CGFloat = 20
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let counter:VSummaryHeaderCounter = VSummaryHeaderCounter(model:modelGyro)
        let viewGyroBase:VComponentGyroBase = VComponentGyroBase(model:modelGyro)
        let viewGyroIcon:VComponentGyroIcon = VComponentGyroIcon(model:modelGyro)
        let viewGyro:VComponentGyro = VComponentGyro(model:modelGyro)
        
        self.counter = counter
        self.viewGyroIcon = viewGyroIcon
        self.viewGyro = viewGyro
        
        addSubview(counter)
        addSubview(viewGyroBase)
        addSubview(viewGyro)
        addSubview(viewGyroIcon)
        
        let views:[String:AnyObject] = [
            "counter":counter,
            "gyroIcon":viewGyroIcon,
            "gyroBase":viewGyroBase,
            "gyro":viewGyro]
        
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
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(margin)-[counter]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(margin)-[counter]-(margin)-|",
            options:[],
            metrics:metrics,
            views:views))
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
    
    //MARK: public
    
    func update(value:CGFloat, maxValue:CGFloat)
    {
        modelGyro.update(value, maxValue:maxValue)
        counter.update()
        viewGyro.update()
    }
}
