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
    
    //MARK: public
    
    func newMaxDistance(maxDistance:DUbikHike)
    {
        if self.maxDistance == nil
        {
            self.maxDistance = maxDistance
        }
        else
        {
            if self.maxDistance!.distance < maxDistance.distance
            {
                self.maxDistance = maxDistance
            }
        }
    }
    
    func newMaxSteps(maxSteps:DUbikHike)
    {
        if self.maxSteps == nil
        {
            self.maxSteps = maxSteps
        }
        else
        {
            if self.maxSteps!.steps < maxSteps.steps
            {
                self.maxSteps = maxSteps
            }
        }
    }
    
    func newCurrent(current:DUbikHike)
    {
        self.current = current
    }
}