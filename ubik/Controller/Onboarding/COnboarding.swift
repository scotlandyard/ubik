import UIKit

class COnboarding:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    let model:MOnboarding
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 50
    
    init()
    {
        model = MOnboarding()
        super.init(transitionStyle:UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.None
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        let pageControl:UIPageControl = UIPageControl()
        pageControl.numberOfPages = model.items.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.currentPageIndicatorTintColor = UIColor.main()
        pageControl.pageIndicatorTintColor = UIColor.complement()
        self.pageControl = pageControl
        
        view.addSubview(pageControl)
        
        let views:[String:AnyObject] = [
            "pageControl":pageControl]
        
        let metrics:[String:AnyObject] = [
            "pageControlBottom":kPageControlBottom]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[pageControl]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[pageControl(pageControlBottom)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        pageAtIndex(0, animated:false, direction:UIPageViewControllerNavigationDirection.Forward)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return false
    }
    
    //MARK: private
    
    private func pageAtIndex(index:Int, animated:Bool, direction:UIPageViewControllerNavigationDirection)
    {
        let item:MOnboardingItem = model.items[index]
        pageControl.currentPage = index
        let controller:UIViewController = item.controller(self)
        setViewControllers([controller], direction:direction, animated:animated, completion:nil)
    }
    
    //MARK: public
    
    func next()
    {
        let currentItem:Int = pageControl.currentPage
        let nextItem:Int = currentItem + 1
        let totalItems:Int = model.items.count
        
        if nextItem < totalItems
        {
            pageAtIndex(nextItem, animated:true, direction:UIPageViewControllerNavigationDirection.Forward)
        }
        else
        {
            parent.onboardingDone()
        }
    }
    
    func previous()
    {
        let currentItem:Int = pageControl.currentPage
        let previousItem:Int = currentItem - 1
        
        if previousItem >= 0
        {
            pageAtIndex(previousItem, animated:true, direction:UIPageViewControllerNavigationDirection.Reverse)
        }
    }
    
    //MARK: pagecontrol del
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 1
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerBeforeViewController viewController:UIViewController) -> UIViewController?
    {
        return nil
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerAfterViewController viewController:UIViewController) -> UIViewController?
    {
        return nil
    }
}