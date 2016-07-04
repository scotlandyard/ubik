import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar!
    weak var current:UIViewController!
    private var controllerRect:CGRect!
    private let kBarHeight:CGFloat = 60
    
    init()
    {
        super.init(nibName:nil, bundle:nil)
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        let configuration:MConfiguration = MConfiguration()
        
        if configuration.onboarding
        {
            startOnboarding()
        }
        else
        {
            startSummary()
        }
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func startBar()
    {
        let bar:VMainBar = VMainBar(controller:self)
        bar.frame = CGRectMake(0, 0, view.bounds.maxX, kBarHeight)
        self.bar = bar
        
        view.addSubview(bar)
    }
    
    private func startOnboarding()
    {
        let controller:COnboarding = COnboarding()
        addChildViewController(controller)
        controller.view.frame = view.bounds
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
    
    private func startSummary()
    {
        if bar == nil
        {
            startBar()
        }
        
        let controller:CSummary = CSummary()
        addChildViewController(controller)
        controller.view.frame = controllerRect
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
}