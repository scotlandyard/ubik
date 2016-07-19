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
}