import Foundation

class MSummary
{
    let items:[MSummaryItem]
    
    init()
    {
        let itemSteps:MSummaryItem = MSummaryItem.Steps()
        let itemTime:MSummaryItem = MSummaryItem.Time()
        
        items = [
            itemSteps,
            itemTime]
    }
}