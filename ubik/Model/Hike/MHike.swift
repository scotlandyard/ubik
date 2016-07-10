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
    
    func fetchHistory() -> [DStepsHike]
    {
        let sortDay:NSSortDescriptor = NSSortDescriptor(key:managerSteps.kEntity_Hike_Day, ascending:true)
        let sorters:[NSSortDescriptor] = [sortDay]
        let history:[DStepsHike] = managerSteps.fetchManagedObjects(managerSteps.kEntity_Hike, sorters:sorters) as! [DStepsHike]
        
        return history
    }
}