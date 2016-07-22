import Foundation

class MSummaryItem
{
    let pay:MComponentPay
    
    class func Steps() -> MSummaryItem
    {
        let model:MSummaryItem = MSummaryItemSteps()
        
        return model
    }
    
    class func Time() -> MSummaryItem
    {
        let model:MSummaryItem = MSummaryItemTime()
        
        return model
    }
    
    init(pay:MComponentPay)
    {
        self.pay = pay
    }
}