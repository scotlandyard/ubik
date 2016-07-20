import Foundation

class MHealthModel
{
    private var map:[NSTimeInterval:MHealthModelItem]
    private var list:[MHealthModelItem]
    weak var today:MHealthModelItem!
    weak var maxDistance:MHealthModelItem?
    weak var maxSteps:MHealthModelItem?
    let lastDate:NSTimeInterval
    
    init(threshold:NSTimeInterval)
    {
        let today:MHealthModelItem = MHealthModelItem(date:threshold)
        self.today = today
        self.lastDate = threshold
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
    
    func pop() -> MHealthModelItem?
    {
        return list.popLast()
    }
    
    func itemFor(date:NSTimeInterval) -> MHealthModelItem?
    {
        return map[date]
    }
    
    func getMaxs()
    {
        print("total items: \(list.count)")

        maxDistance = nil
        maxSteps = nil
        
        for item:MHealthModelItem in list
        {
            if item !== today
            {
                if maxSteps == nil
                {
                    maxSteps = item
                }
                else if item.steps > maxSteps!.steps
                {
                    maxSteps = item
                }
                
                if maxDistance == nil
                {
                    maxDistance = item
                }
                else if item.distance > maxDistance!.distance
                {
                    maxDistance = item
                }
            }
        }
    }
}