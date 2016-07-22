import Foundation

class MSummary
{
    let items:[MSummaryItem]
    
    class func Empty() -> MSummary
    {
        let model:MSummary = MSummaryEmpty()
        
        return model
    }
    
    class func Filled() -> MSummary
    {
        let model:MSummary = MSummaryFilled()
        
        return model
    }
    
    init(items:[MSummaryItem])
    {
        self.items = items
    }
}