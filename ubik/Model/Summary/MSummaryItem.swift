import Foundation

class MSummaryItem
{
    let pay:MComponentPay
    let title:String?
    
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
    
    class func Empty() -> MSummaryItem
    {
        let model:MSummaryItem = MSummaryItemEmpty()
        
        return model
    }
    
    init(pay:MComponentPay, title:String?)
    {
        self.pay = pay
        self.title = title
    }
}