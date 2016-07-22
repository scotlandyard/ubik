import Foundation

class MSummaryItemSteps:MSummaryItem
{
    init()
    {
        let pay:MComponentPay = MComponentPay.Steps()
        super.init(pay:pay)
    }
}