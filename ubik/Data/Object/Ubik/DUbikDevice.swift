import Foundation
import CoreData

@objc(DUbikDevice)
class DUbikDevice:NSManagedObject
{
    @NSManaged private(set) var version:String
    @NSManaged private(set) var onboarded:Bool
    @NSManaged private(set) var notifications:Bool
    
    override class func entityName() -> String
    {
        return "Device"
    }
}