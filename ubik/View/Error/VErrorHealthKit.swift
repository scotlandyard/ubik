import UIKit

class VErrorHealthKit:UIView
{
    weak var controller:CErrorHealthKit!
    
    convenience init(controller:CErrorHealthKit)
    {
        self.init()
        self.controller = controller
        backgroundColor = UIColor.whiteColor()
        clipsToBounds = true
        userInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(22)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.main()
        label.text = NSLocalizedString("VErrorHealthKit_label", comment:"")
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-50-[label]-50-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}
