import UIKit

class VHistoryChartTouch:UIView
{
    weak var chart:VHistoryChart!
    
    convenience init(chart:VHistoryChart)
    {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        self.chart = chart
    }
    
    override func touchesBegan(touches:Set<UITouch>, withEvent event:UIEvent?)
    {
        if !touches.isEmpty
        {
            let touch:UITouch = touches.first!
            touchProcess(touch)
        }
    }
    
    override func touchesMoved(touches:Set<UITouch>, withEvent event:UIEvent?)
    {
        if !touches.isEmpty
        {
            let touch:UITouch = touches.first!
            touchProcess(touch)
        }
    }
    
    //MARK: private
    
    private func touchProcess(touch:UITouch)
    {
        let point:CGPoint = touch.locationInView(self)
        let x:CGFloat = point.x
        chart.touching(x)
    }
}