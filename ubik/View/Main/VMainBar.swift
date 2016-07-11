import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    weak var buttonSummary:VMainBarButton!
    weak var buttonHistory:VMainBarButton!
    weak var buttonConfig:VMainBarButton!
    private weak var layoutSummaryLeft:NSLayoutConstraint!
    private weak var layoutHistoryLeft:NSLayoutConstraint!
    private weak var layoutConfigLeft:NSLayoutConstraint!
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
            "H:[buttonHistory(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonConfig(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[buttonSummary(buttonWidth)]",
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
        
        layoutSummaryLeft = NSLayoutConstraint(
            item:buttonSummary,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        layoutHistoryLeft = NSLayoutConstraint(
            item:buttonHistory,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        layoutConfigLeft = NSLayoutConstraint(
            item:buttonConfig,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutSummaryLeft)
        addConstraint(layoutHistoryLeft)
        addConstraint(layoutConfigLeft)
    }
}
