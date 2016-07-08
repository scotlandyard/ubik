import UIKit

class VOnboardingItemReady:UIView
{
    weak var controller:COnboardingItemReady!
    weak var layoutButtonsLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 100
    
    convenience init(controller:COnboardingItemReady)
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
        label.text = NSLocalizedString("VOnboardingItemWelcome_label", comment:"")
        
        let button:UIButton = UIButton()
        button.setTitleColor(UIColor.main(), forState:UIControlState.Normal)
        button.setTitleColor(UIColor.main().colorWithAlphaComponent(0.2), forState:UIControlState.Highlighted)
        button.setTitle(NSLocalizedString("VOnboardingItemWelcome_button", comment:""), forState:UIControlState.Normal)
        button.titleLabel?.font = UIFont.bold(18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.actionNext(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        
        addSubview(label)
        addSubview(button)
        
        let views:[String:AnyObject] = [
            "label":label,
            "button":button]
        
        let metrics:[String:AnyObject] = [:]
        
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
            "V:|-270-[label(80)]-0-[button(60)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: actions
    
    func actionNext(sender button:UIButton)
    {
        controller.onboarding.next()
    }
}