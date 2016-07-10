import Foundation
import CoreData

@objc(DStepsHike)
class DStepsHike:NSManagedObject
{
    @NSManaged private(set) var amount:Step
    @NSManaged private(set) var day:Timestamp
    
    typealias Step = Int32
    typealias Timestamp = NSTimeInterval
    
    //MARK: public
    
    func record(day:Timestamp, amount:Step)
    {
        self.day = day
        self.amount = amount
    }
    
    func add(steps:Step)
    {
        amount += steps
    }
    
    func date() -> NSDate
    {
        let date:NSDate = NSDate(timeIntervalSince1970:day)
        
        return date
    }
}