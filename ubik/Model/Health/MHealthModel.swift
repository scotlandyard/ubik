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
    
    private func add(item:MHealthModelItem)
    {
        map[item.date] = item
        list.append(item)
    }
    
    private func itemFor(date:NSTimeInterval) -> MHealthModelItem?
    {
        return map[date]
    }
    
    //MARK: public
    
    func increase(timestamp:NSTimeInterval, steps:Int32 = 0, distance:Int32 = 0)
    {
        var item:MHealthModelItem? = itemFor(timestamp)
        
        if item == nil
        {
            item = MHealthModelItem(date:timestamp)
            add(item!)
        }
        
        item!.steps += steps
        item!.distance += distance
    }
    
    func pop() -> MHealthModelItem?
    {
        return list.popLast()
    }
    
    func getMaxs()
    {
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