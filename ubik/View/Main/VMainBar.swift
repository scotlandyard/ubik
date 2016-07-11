import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    weak var buttonSummary:VMainBarButton!
    weak var buttonHistory:VMainBarButton!
    weak var buttonConfig:VMainBarButton!
    private let kButtonWidth:CGFloat = 70
    private let kButtonHeight:CGFloat = 60
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.complement()
        clipsToBounds = true
        self.controller = controller
        
        let buttonSummary:VMainBarButton = VMainBarButton.Summary()
        self.buttonSummary = buttonSummary
        
        let buttonHistory:VMainBarButton = VMainBarButton.History()
        self.buttonHistory = buttonHistory
        
        let buttonConfig:VMainBarButton = VMainBarButton.Config()
        self.buttonConfig = buttonConfig
        
        addSubview(buttonHistory)
        addSubview(buttonConfig)
        addSubview(buttonSummary)
        
        let views:[String:AnyObject] = [
            "buttonSummary":buttonSummary,
            "buttonHistory":buttonHistory,
            "buttonConfig":buttonConfig]
        
        let metrics:[String:AnyObject] = [
            "buttonWidth":kButtonWidth,
            "buttonHeight":kButtonHeight]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[buttonHistory(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonConfig(buttonWidth)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[buttonSummary]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonSummary(buttonHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonHistory(buttonHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[buttonConfig(buttonHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}
