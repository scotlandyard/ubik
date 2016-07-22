import Foundation

class MSummaryFilled:MSummary
{
    init()
    {
        let itemSteps:MSummaryItem = MSummaryItem.Steps()
        let itemTime:MSummaryItem = MSummaryItem.Time()
        
        let items = [
                itemSteps,
                itemTime]
        
        super.init(items:items)
    }
}