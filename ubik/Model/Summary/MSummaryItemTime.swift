import Foundation

class MSummaryItemTime:MSummaryItem
{
    init()
    {
        let now:NSDate = NSDate()
        let currentTime:NSTimeInterval = now.timeIntervalSince1970
        let pay:MComponentPay = MComponentPay.Time(currentTime)
        let title:String = NSLocalizedString("MSummaryItemTime_title", comment:"")
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        
        let amount:String = numberFormatter.stringFromNumber(pay.percentage)!
        
        super.init(pay:pay, title:title, amount:amount)
    }
}