import UIKit

class MHistoryItem
{
    let distance:String
    let steps:String
    let date:String
    let percentage:CGFloat
    
    init(distance:String, steps:String, date:String, percentage:CGFloat)
    {
        self.distance = distance
        self.steps = steps
        self.date = date
        self.percentage = percentage
    }
}