import Foundation
import CoreData

@objc(DUbikDevice)
class DUbikDevice:NSManagedObject
{
    @NSManaged private(set) var version:String
    @NSManaged private(set) var measures:Int16
    @NSManaged private(set) var onboarded:Bool
    @NSManaged private(set) var notifications:Bool
    
    override class func entityName() -> String
    {
        return "Device"
    }
    
    //MARK: public
    
    func newVersion(version:String)
    {
        self.version = version
    }
    
    func onboardingDone()
    {
        self.onboarded = true
    }
}