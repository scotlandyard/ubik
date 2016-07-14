import UIKit

class MHistoryItem
{
    let amount:String
    let date:String
    let percentage:CGFloat
    let percentagePrevious:CGFloat
    
    init(amount:String, date:String, percentage:CGFloat, percentagePrevious:CGFloat)
    {
        self.amount = amount
        self.date = date
        self.percentage = percentage
        self.percentagePrevious = percentagePrevious
    }
}