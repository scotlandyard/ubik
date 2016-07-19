import Foundation

class MHealthModel
{
    private var map:[NSTimeInterval:MHealthModelItem]
    private var list:[MHealthModelItem]
    weak var today:MHealthModelItem!
    weak var maxDistance:MHealthModelItem!
    weak var maxSteps:MHealthModelItem!
    
    init(threshold:NSTimeInterval)
    {
        let today:MHealthModelItem = MHealthModelItem(date:threshold)
        self.today = today
        map = [:]
        list = []
        
        add(today)
    }
    
    //MARK: public
    
    func add(item:MHealthModelItem)
    {
        map[item.date] = item
        list.append(item)
    }
    
    func itemFor(date:NSTimeInterval) -> MHealthModelItem?
    {
        return map[date]
    }
    
    func getMaxs()
    {
        maxDistance = today
        maxSteps = today
        
        for item:MHealthModelItem in list
        {
            if item
        }
    }
}