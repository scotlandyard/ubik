import Foundation
import CoreData

@objc(DStepsHike)
class DStepsHike:NSManagedObject
{
    //MARK: public
    
    func record(day:NSTimeInterval, amount:Int16)
    {
        self.day = day
        self.amount = amount
    }
}