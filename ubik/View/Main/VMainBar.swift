import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    weak var buttonHistory:VMainBarButton!
    private let kButtonWidth:CGFloat = 100
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.complement()
        clipsToBounds = true
        self.controller = controller
        
        let buttonHistory:VMainBarButton = VMainBarButton.History()
        self.buttonHistory = buttonHistory
        
        addSubview(buttonHistory)
        
        let views:[String:AnyObject] = [
            "buttonHistory":buttonHistory]
        
        let metrics:[String:AnyObject] = [
            "buttonWidth":kButtonWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[buttonHistory(buttonWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[buttonHistory(40)]",
            options:[],
            metrics:metrics,
            views:views))
    }
}
