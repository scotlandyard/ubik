import Foundation

class MSummaryItemEmpty:MSummaryItem
{
    init()
    {
        let pay:MComponentPay = MComponentPay.Empty()
        super.init(pay:pay)
    }
}