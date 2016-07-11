import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar!
    weak var current:UIViewController!
    private var controllerRect:CGRect!
    private var statusBarStyle:UIStatusBarStyle
    private let kBarHeight:CGFloat = 60
    private let kAnimationDuration:NSTimeInterval = 0.3
    
    enum CMainParentScroll
    {
        case Left
        case Right
    }
    
    private lazy var leftRect:CGRect =
    {
        let rect:CGRect = CGRectMake(-self.controllerRect.maxX, self.controllerRect.minY, self.controllerRect.maxX, self.controllerRect.maxY)
        
        return rect
    }()
    
    private lazy var rightRect:CGRect =
    {
        let rect:CGRect = CGRectMake(self.controllerRect.maxX, self.controllerRect.minY, self.controllerRect.maxX, self.controllerRect.maxY)
        
        return rect
    }()
    
    init()
    {
        statusBarStyle = UIStatusBarStyle.Default
        
        super.init(nibName:nil, bundle:nil)
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        
        if MConfiguration.sharedInstance.experience.onboardingDone
        {
            startSummary()
        }
        else
        {
            startOnboarding()
        }
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
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
    
    private func showController(controller:UIViewController, scroll:CMainParentScroll)
    {
        switch scroll
        {
            case CMainParentScroll.Left:
        
                controller.view.frame = rightRect
                
                break
                
            case CMainParentScroll.Right:
                
                controller.view.frame = leftRect
                
                break
        }
        
        current.willMoveToParentViewController(nil)
        addChildViewController(controller)
        
        transitionFromViewController(
            current,
            toViewController:controller,
            duration:kAnimationDuration,
            options:UIViewAnimationOptions.CurveEaseOut,
            animations:
            {
                controller.view.frame = self.controllerRect
                
                switch scroll
                {
                    case CMainParentScroll.Left:
                        
                        self.current.view.frame = self.leftRect
                        
                        break
                        
                    case CMainParentScroll.Right:
                        
                        self.current.view.frame = self.rightRect
                        
                        break
                }
            })
        { (done) in
            
            self.current.removeFromParentViewController()
            controller.didMoveToParentViewController(self)
            self.current = controller
        }
    }
    
    //MARK: public
    
    func startSummary()
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
        current = controller
        
        bar.selectSummary(false)
    }
    
    func showHistory()
    {
        let history:CHistory = CHistory()
        showController(history, scroll:CMainParentScroll.Right)
    }
    
    func showSummaryFromLeft()
    {
        let summary:CSummary = CSummary()
        showController(summary, scroll:CMainParentScroll.Right)
    }
    
    func showSummaryFromRight()
    {
        let summary:CSummary = CSummary()
        showController(summary, scroll:CMainParentScroll.Left)
    }
    
    func statusBarLight()
    {
        statusBarStyle = UIStatusBarStyle.LightContent
        parent.setNeedsStatusBarAppearanceUpdate()
    }
    
    func statusBarDefault()
    {
        statusBarStyle = UIStatusBarStyle.Default
        parent.setNeedsStatusBarAppearanceUpdate()
    }
}