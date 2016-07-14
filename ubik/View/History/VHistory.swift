import UIKit

class VHistory:UIView
{
    weak var controller:CHistory!
    weak var chart:VHistoryChart!
    
    convenience init(controller:CHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let chart:VHistoryChart = VHistoryChart()
        self.chart = chart
        
        addSubview(chart)
        
        let views:[String:AnyObject] = [
            "chart":chart]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[chart]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[chart]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}