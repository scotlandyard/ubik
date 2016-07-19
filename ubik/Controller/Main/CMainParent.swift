import UIKit

class CMainParent:UIViewController
{
    weak var bar:VMainBar!
    weak var current:UIViewController?
    private var controllerRect:CGRect!
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.Default
    private let kBarHeight:CGFloat = 64
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        controllerRect = CGRectMake(0, kBarHeight, view.bounds.maxX, view.bounds.maxY - kBarHeight)
        startSession()
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
    
    private func startSession()
    {
        let landing:CLanding = CLanding()
        rootController(landing, bar:false)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            MConfiguration.sharedInstance.loadSession(self)
        }
    }
    
    private func rootController(controller:UIViewController, bar:Bool)
    {
        current?.view.removeFromSuperview()
        current?.removeFromParentViewController()
        current = controller
        
        addChildViewController(controller)
        
        if bar
        {
            controller.view.frame = controllerRect
        }
        else
        {
            controller.view.frame = view.bounds
        }
        
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
    
    private func loadOnboarding()
    {
        let onboarding:COnboarding = COnboarding()
        rootController(onboarding, bar:false)
    }
    
    private func onboardingDone()
    {
        let summary:CSummary = CSummary()
        rootController(summary, bar:true)
        
        let bar:VMainBar = VMainBar(controller:self)
        bar.frame = CGRectMake(0, 0, view.bounds.maxX, kBarHeight)
        bar.selectSummary(false)
        self.bar = bar

        view.addSubview(bar)
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
        
        current!.willMoveToParentViewController(nil)
        addChildViewController(controller)
        
        transitionFromViewController(
            current!,
            toViewController:controller,
            duration:kAnimationDuration,
            options:UIViewAnimationOptions.CurveEaseOut,
            animations:
            {
                controller.view.frame = self.controllerRect
                
                switch scroll
                {
                    case CMainParentScroll.Left:
                        
                        self.current!.view.frame = self.leftRect
                        
                        break
                        
                    case CMainParentScroll.Right:
                        
                        self.current!.view.frame = self.rightRect
                        
                        break
                }
            })
        { (done) in
            
            self.current!.removeFromParentViewController()
            controller.didMoveToParentViewController(self)
            self.current = controller
        }
    }
    
    //MARK: public
    
    func sessionLoaded()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            if MConfiguration.sharedInstance.device!.onboarded
            {
                self?.onboardingDone()
            }
            else
            {
                self?.loadOnboarding()
            }
        }
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
    
    func showConfig()
    {
        let config:CSettings = CSettings()
        showController(config, scroll:CMainParentScroll.Left)
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