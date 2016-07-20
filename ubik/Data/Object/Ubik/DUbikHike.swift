import Foundation
import CoreData

@objc(DUbikHike)
class DUbikHike:NSManagedObject
{
    @NSManaged private(set) var sessionMaxDistance:DUbikSession?
    @NSManaged private(set) var sessionMaxSteps:DUbikSession?
    @NSManaged private(set) var date:NSTimeInterval
    @NSManaged private(set) var distance:Int32
    @NSManaged private(set) var steps:Int32
    
    override class func entityName() -> String
    {
        return "Hike"
    }
    
    //MARK: public
    
    func parse(item:MHealthModelItem)
    {
        self.date = item.date
        self.distance = item.distance
        self.steps = item.steps
    }
}