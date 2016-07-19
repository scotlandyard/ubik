import Foundation
import CoreData

@objc(DStepsHike)
class DStepsHike:NSManagedObject
{
    @NSManaged private(set) var amount:Int32
    @NSManaged private(set) var day:NSTimeInterval
    @NSManaged private(set) var distance:Int32
    
    //MARK: public
    
    func record(day:NSTimeInterval, amount:Int32)
    {
        self.day = day
        self.amount = amount
    }
    
    func date() -> NSDate
    {
        let date:NSDate = NSDate(timeIntervalSince1970:day)
        
        return date
    }
}