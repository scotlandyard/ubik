import Foundation
import CoreData

@objc(DUbikDevice)
class DUbikDevice:NSManagedObject
{
    @objc enum DUbikDeviceMeasures:Int16
    {
        case Metric
        case Imperial
    }
    
    @NSManaged private(set) var version:String
    @NSManaged private(set) var measures:DUbikDeviceMeasures
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
    
    func measuresMetric()
    {
        measures = DUbikDeviceMeasures.Metric
    }
    
    func measuresImperial()
    {
        measures = DUbikDeviceMeasures.Imperial
    }
}