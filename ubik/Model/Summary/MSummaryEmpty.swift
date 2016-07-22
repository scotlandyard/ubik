import Foundation

class MSummaryEmpty:MSummary
{
    init()
    {
        let itemEmptyA:MSummaryItem = MSummaryItem.Empty()
        let itemEmptyB:MSummaryItem = MSummaryItem.Empty()
        
        let items:[MSummaryItem] = [
            itemEmptyA,
            itemEmptyB
        ]
        
        super.init(items:items)
    }
}