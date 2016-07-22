import Foundation

class MSummaryItem
{
    class func Steps() -> MSummaryItem
    {
        let model:MSummaryItem = MSummaryItemSteps()
        
        return model
    }
    
    class func Item() -> MSummaryItem
    {
        let model:MSummaryItem = MSummaryItemItem()
        
        return model
    }
}