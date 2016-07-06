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
        
        addSubview(icon)
        
        let views:[String:AnyObject] = [
            "icon":icon]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[icon]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[icon(160)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}