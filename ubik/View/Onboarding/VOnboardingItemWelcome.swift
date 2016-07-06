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
        label.font = UIFont.regular(19)
        label.text = NSLocalizedString("VOnboardingItemWelcome_label", comment:"")
        
        let button:UIButton = UIButton()
        button.setTitleColor(UIColor.main(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor.main().colorWithAlphaComponent(0.2), forState:UIControlState.Highlighted)
        button.setTitle(NSLocalizedString("VOnboardingItemWelcome_button", comment:""), forState:UIControlState.Normal)
        button.titleLabel?.font = UIFont.bold(18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(icon)
        addSubview(label)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "icon":icon,
            "label":label,
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[icon]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-5-[label]-5-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-80-[button]-80-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-200-[icon(70)]-0-[label(80)]-0-[button(60)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}