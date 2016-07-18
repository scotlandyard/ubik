import UIKit

class MHistoryItem
{
    let amount:String
    let date:String
    let percentage:CGFloat
    
    init(amount:String, date:String, percentage:CGFloat)
    {
        self.amount = amount
        self.date = date
        self.percentage = percentage
    }
}