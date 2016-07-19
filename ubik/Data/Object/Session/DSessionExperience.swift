import Foundation
import CoreData

@objc(DSessionExperience)
class DSessionExperience:NSManagedObject
{
    @NSManaged var onboardingDone:Bool
    @NSManaged var version:String
    @NSManaged var lastHike:NSTimeInterval
    @NSManaged var notifications:Bool
}