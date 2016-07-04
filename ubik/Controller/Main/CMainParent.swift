import UIKit

class CMainParent:UIViewController
{
    weak var current:UIViewController!
    private var controllerRect:CGRect!
    private let kBarHeight:CGFloat = 60
    
    init()
    {
        super.init(nibName:nil, bundle:nil)
        
        let configuration:MConfiguration = MConfiguration()
        let controller:UIViewController
        
        if configuration.onboarding
        {
            controller = COnboarding()
        }
        else
        {
            controller = CSummary()
        }
        
        current = controller
        startWithRoot(controller)
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func startWithRoot(controller:UIViewController)
    {
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        addChildViewController(controller)
        controller.view.frame = controllerRect
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
        
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
}