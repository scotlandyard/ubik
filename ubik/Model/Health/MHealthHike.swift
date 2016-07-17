import Foundation

class MHealthHike
{
    let timestamp:NSTimeInterval
    private(set) var amount:Int32
    
    init(timestamp:NSTimeInterval, amount:Int32)
    {
        self.timestamp = timestamp
        self.amount = amount
    }
    
    //MARK: public
    
    func add(steps:Int32)
    {
        amount += steps
    }
}