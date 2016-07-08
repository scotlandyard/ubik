import UIKit

class VOnboardingItemPermission:UIView
{
    weak var controller:COnboardingItemPermission!
    weak var layoutButtonsLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 100
    
    convenience init(controller:COnboardingItemPermission)
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
        label.text = NSLocalizedString("VOnboardingItemPermission_label", comment:"")
        
        let buttonNext:UIButton = UIButton()
        buttonNext.setTitleColor(UIColor.main(), forState:UIControlState.Normal)
        buttonNext.setTitleColor(UIColor.main().colorWithAlphaComponent(0.2), forState:UIControlState.Highlighted)
        buttonNext.setTitle(NSLocalizedString("VOnboardingItemPermission_buttonNext", comment:""), forState:UIControlState.Normal)
        buttonNext.titleLabel?.font = UIFont.bold(18)
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        buttonNext.addTarget(self, action:#selector(self.actionNext(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        
        let buttonPrevious:UIButton = UIButton()
        buttonPrevious.setTitleColor(UIColor(white:0.7, alpha:1), forState:UIControlState.Normal)
        buttonPrevious.setTitleColor(UIColor.complement(), forState:UIControlState.Highlighted)
        buttonPrevious.setTitle(NSLocalizedString("VOnboardingItemPermission_buttonPrevious", comment:""), forState:UIControlState.Normal)
        buttonPrevious.titleLabel?.font = UIFont.bold(18)
        buttonPrevious.translatesAutoresizingMaskIntoConstraints = false
        buttonPrevious.addTarget(self, action:#selector(self.actionPrevious(sender:)), forControlEvents:UIControlEvents.TouchUpInside)
        
        addSubview(label)
        addSubview(buttonNext)
        addSubview(buttonPrevious)
        
        let views:[String:AnyObject] = [
            "label":label,
            "buttonNext":buttonNext,
            "buttonPrevious":buttonPrevious]
        
        let metrics:[String:AnyObject] = [
            "buttonWidth":kButtonWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-40-[label]-40-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonPrevious(buttonWidth)]-0-[buttonNext(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-250-[label(100)]-0-[buttonNext(60)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label]-0-[buttonPrevious(60)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutButtonsLeft = NSLayoutConstraint(
            item:buttonPrevious,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutButtonsLeft)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let buttonsWidth:CGFloat = kButtonWidth + kButtonWidth
        let remain:CGFloat = width - buttonsWidth
        let margin:CGFloat = remain / 2.0
        
        layoutButtonsLeft.constant = margin
    }
    
    //MARK: actions
    
    func actionNext(sender button:UIButton)
    {
        controller.askPermission()
    }
    
    func actionPrevious(sender button:UIButton)
    {
        controller.onboarding.previous()
    }
}