import Foundation

class MSummaryItemTime:MSummaryItem
{
    init()
    {
        let now:NSDate = NSDate()
        let currentTime:NSTimeInterval = now.timeIntervalSince1970
        let pay:MComponentPay = MComponentPay.Time(currentTime)
        let title:String = NSLocalizedString("MSummaryItemTime_title", comment:"")
        let amount:String = "much"
        
        super.init(pay:pay, title:title, amount:amount)
    }
}