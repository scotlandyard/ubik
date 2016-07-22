import Foundation

class MSummary
{
    let items:[MSummaryItem]
    
    class func Empty() -> MSummary
    {
        
    }
    
    init()
    {
        let itemSteps:MSummaryItem = MSummaryItem.Steps()
        let itemTime:MSummaryItem = MSummaryItem.Time()
        
        items = [
            itemSteps,
            itemTime]
    }
}