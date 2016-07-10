import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    weak var buttonHistory:VMainBarButton!
    weak var buttonConfig:VMainBarButton!
    private let kButtonWidth:CGFloat = 65
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.complement()
        clipsToBounds = true
        self.controller = controller
        
        let buttonHistory:VMainBarButton = VMainBarButton.History()
        self.buttonHistory = buttonHistory
        
        let buttonConfig:VMainBarButton = VMainBarButton.Config()
        self.buttonConfig = buttonConfig
        
        addSubview(buttonHistory)
        addSubview(buttonConfig)
        
        let views:[String:AnyObject] = [
            "buttonHistory":buttonHistory,
            "buttonConfig":buttonConfig]
        
        let metrics:[String:AnyObject] = [
            "buttonWidth":kButtonWidth]
        
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
            "V:|-20-[buttonHistory(40)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[buttonConfig(40)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}
