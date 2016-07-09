import Foundation

class MHike
{
    static let sharedInstance = MHike()
    private let managerSteps:DManagerModelSteps
    
    private init()
    {
        managerSteps = DManager.sharedInstance.managerSteps
    }
    
    //MARK: public
    
    func newHike() -> DStepsHike
    {
        let hike:DStepsHike = managerSteps.createManagedObject(managerSteps.kEntity_Hike) as! DStepsHike
        
        return hike
    }
    
    func saveSession()
    {
        managerSteps.saveContext()
    }
}