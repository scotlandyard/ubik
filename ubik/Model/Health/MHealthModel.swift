import Foundation

class MHealthModel
{
    private var map:[NSTimeInterval:MHealthModelItem]
    weak var today:MHealthModelItem!
    
    init(threshold:NSTimeInterval)
    {
        let today:MHealthModelItem = MHealthModelItem(date:threshold)
        self.today = today
        map = [:]
        
        add(today)
    }
    
    //MARK: public
    
    func add(item:MHealthModelItem)
    {
        map[item.date] = item
    }
    
    func itemFor(date:NSTimeInterval) -> MHealthModelItem?
    {
        return map[date]
    }
}