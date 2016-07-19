import Foundation
import CoreData

@objc(DUbikSession)
class DUbikSession:NSManagedObject
{
    @NSManaged private(set) var lastDate:NSTimeInterval
    @NSManaged private(set) var maxDistance:DUbikHike?
    @NSManaged private(set) var maxSteps:DUbikHike?
    @NSManaged private(set) var current:DUbikHike?
    
    override class func entityName() -> String
    {
        return "Session"
    }
}