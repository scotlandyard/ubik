import Foundation
import CoreData

@objc(DSessionExperience)
class DSessionExperience:NSManagedObject
{
    @NSManaged private(set) var onboardingDone:Bool
    @NSManaged private(set) var version:String
    @NSManaged private(set) var lastHike:NSTimeInterval
    @NSManaged private(set) var notifications:Bool
}