import Foundation

class MSummaryItemTime:MSummaryItem
{
    init()
    {
        let now:NSDate = NSDate()
        let currentTime:NSTimeInterval = now.timeIntervalSince1970
        let pay:MComponentPay = MComponentPay.Time(currentTime)
        super.init(pay:pay)
    }
}