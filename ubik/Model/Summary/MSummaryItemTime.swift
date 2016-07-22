import Foundation

class MSummaryItemTime:MSummaryItem
{
    init()
    {
        let pay:MComponentPay = MComponentPay.Time()
        super.init(pay:pay)
    }
}