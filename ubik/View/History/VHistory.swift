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
    }
}