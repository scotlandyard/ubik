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
        let history:[DStepsHike] = managerSteps.fetchManagedObjects(managerSteps.kEntity_Hike, limit:0, sorters:sorters) as! [DStepsHike]
        
        return history
    }
    
    func fetchMaxHike() -> DStepsHike?
    {
        let hike:DStepsHike?
        let sortAmount:NSSortDescriptor = NSSortDescriptor(key:managerSteps.kEntity_hike_Amount, ascending:false)
        let sorters:[NSSortDescriptor] = [sortAmount]
        let max:[DStepsHike] = managerSteps.fetchManagedObjects(managerSteps.kEntity_Hike, limit:1, sorters:sorters) as! [DStepsHike]
        
        if max.isEmpty
        {
            hike = nil
        }
        else
        {
            hike = max.first
        }
        
        return hike
    }
}