import Foundation

class MHealthModelItem
{
    let date:NSTimeInterval
    var steps:Int32
    var distance:Int32
    
    init(date:NSTimeInterval)
    {
        self.date = date
        steps = 0
        distance = 0
    }
}