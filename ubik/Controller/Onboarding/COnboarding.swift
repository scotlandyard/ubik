import UIKit

class COnboarding:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    weak var pageControl:UIPageControl!
    private let kPageControlBottom:Int = 35
    
    init()
    {
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
}