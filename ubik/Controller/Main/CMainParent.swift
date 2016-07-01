import UIKit

class CMainParent:UIViewController
{
    var current:UIViewController
    private var controllerRect:CGRect!
    private let kBarHeight:CGFloat = 70
    
    init()
    {
        let summary:CSummary = CSummary()
        current = summary
        
        super.init(nibName:nil, bundle:nil)
        
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        addChildViewController(summary)
        summary.view.frame = controllerRect
        view.addSubview(summary.view)
        summary.didMoveToParentViewController(self)
        
        let bar:VMainBar = VMainBar(controller:self)
        view.addSubview(bar)
        
        let views:[String:AnyObject] = [
            "bar":bar]
        
        let metrics:[String:AnyObject] = [
            "barHeight":kBarHeight]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[bar]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[bar(barHeight)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
}