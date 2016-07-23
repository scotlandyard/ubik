import UIKit

class MHistoryItem
{
    let distance:String
    let steps:String
    let ratio:String
    let date:String
    let percentage:CGFloat
    let components:[MHistoryItemComponent<VHistoryChartDisplayCell>]
    
    init(distance:String, steps:String, ratio:String, date:String, percentage:CGFloat)
    {
        self.distance = distance
        self.steps = steps
        self.ratio = ratio
        self.date = date
        self.percentage = percentage
        
        components = [
        ]
    }
}