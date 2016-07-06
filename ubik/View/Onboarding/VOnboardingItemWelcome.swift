import UIKit

class VOnboardingItemWelcome:UIView
{
    weak var controller:COnboardingItemWelcome!
    
    convenience init(controller:COnboardingItemWelcome)
    {
        self.init()
        self.controller = controller
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        
        let icon:UIImageView = UIImageView()
        icon.userInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.Center
        icon.image = UIImage(named:"logo")
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.regular(15)
        label.text = NSLocalizedString("VOnboardingItemWelcome_label", comment:"")
        
        addSubview(icon)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "icon":icon,
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[icon]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-60-[label]-60-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-150-[icon(75)]-0-[label]",
            options:[],
            metrics:metrics,
            views:views))
    }
}