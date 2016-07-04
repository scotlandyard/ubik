import UIKit

class COnboarding:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    let model:MOnboarding
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 35
    
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
    }
    
    //MARK: pagecontrol del
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        let count:Int = model.items.count
        
        return count
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerBeforeViewController viewController:UIViewController) -> UIViewController?
    {
        return UIViewController()
    }
    
    func pageViewController(pageViewController:UIPageViewController, viewControllerAfterViewController viewController:UIViewController) -> UIViewController?
    {
        return UIViewController()
    }
}