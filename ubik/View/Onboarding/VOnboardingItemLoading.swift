import UIKit

class VOnboardingItemLoading:UIView
{
    weak var controller:COnboardingItemLoading!
    weak var spinner:VMainLoader!
    
    convenience init(controller:COnboardingItemLoading)
    {
        self.init()
        self.controller = controller
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.regular(19)
        label.text = NSLocalizedString("VOnboardingItemLoading_label", comment:"")
        
        let spinner:VMainLoader = VMainLoader()
        self.spinner = spinner
        
        addSubview(label)
        addSubview(spinner)
        
        let views:[String:AnyObject] = [
            "label":label,
            "spinner":spinner]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-40-[label]-40-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-250-[label(100)]-0-[spinner(60)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[spinner]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}