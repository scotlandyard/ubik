import Foundation
import CoreData

class MHike:DManagerDelegate
{
    static let sharedInstance = MHike()
    private weak var managerSteps:DManagerModelSteps!
    
    private init()
    {
        managerSteps = DManager.sharedInstance.managerSteps
    }
    
    //MARK: public
    
    func newHike(day:NSTimeInterval, amount:Int32)
    {
        managerSteps.createManagedObject(managerSteps.kEntity_Hike)
        { (rawHike) in
            
            let hike:DStepsHike = rawHike as! DStepsHike
            hike.record(day, amount:amount)
        }
    }
    
    func saveSession()
    {
        managerSteps.saver.save(false)
    }
    
    func fetchHistory(block:[DStepsHike] -> ())
    {
        let sortDay:NSSortDescriptor = NSSortDescriptor(key:managerSteps.kEntity_Hike_Day, ascending:false)
        let sorters:[NSSortDescriptor] = [sortDay]
        managerSteps.fetchManagedObjects(managerSteps.kEntity_Hike, limit:0, predicate:nil, sorters:sorters)
        { (managedObjects) in
            
            let history:[DStepsHike] = managedObjects as! [DStepsHike]
            block(history)
        }
    }
    
    func fetchMaxHike(block:DStepsHike? -> ())
    {
        let sortAmount:NSSortDescriptor = NSSortDescriptor(key:managerSteps.kEntity_hike_Amount, ascending:false)
        let sorters:[NSSortDescriptor] = [sortAmount]
        managerSteps.fetchManagedObjects(managerSteps.kEntity_Hike, limit:1, predicate:nil, sorters:sorters)
        { (managedObjects) in
            
            let hike:DStepsHike?
            
            if managedObjects.isEmpty
            {
                hike = nil
            }
            else
            {
                hike = managedObjects.first as? DStepsHike
            }
            
            block(hike)
        }
    }
    
    //MARK: dmanager del
    
    func dManagerFetched(results:[NSManagedObject], manager:DManagerModel, entity:String)
    {
    }
    
    func dManagerCreated(result:NSManagedObject, manager:DManagerModel, entity:String)
    {
    }
}