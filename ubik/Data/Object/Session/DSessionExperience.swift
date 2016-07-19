import Foundation
import CoreData

@objc(DSessionExperience)
class DSessionExperience:NSManagedObject
{
    @NSManaged private(set) var onboardingDone:Bool
    @NSManaged private(set) var version:String
    @NSManaged private(set) var lastHike:NSTimeInterval
    @NSManaged private(set) var maxKm:Int32
    @NSManaged private(set) var maxStep:Int32
    @NSManaged private(set) var notifications:Bool
    
    //MARK: public
    
    func newVersion(version:String)
    {
        self.version = version
    }
    
    func finishedOnboarding()
    {
        onboardingDone = true
    }
}