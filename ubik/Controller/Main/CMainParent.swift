import UIKit

class CMainParent:UIViewController
{
    var current:UIViewController
    
    init()
    {
        let summary:CSummary = CSummary()
        current = summary
        
        super.init(nibName:nil, bundle:nil)
        
        addChildViewController(summary)
        summary.view.frame = view.bounds
        view.addSubview(summary.view)
        summary.didMoveToParentViewController(self)
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
}