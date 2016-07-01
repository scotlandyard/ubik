import Foundation
import CoreData

class DManager
{
    let managedObjectModel:NSManagedObjectModel
    let managedObjectContext:NSManagedObjectContext
    let persistentStoreCoordinator:NSPersistentStoreCoordinator
    private let kModelName:String = "DModel"
    private let kModelExtension:String = "momd"
    private let kSQLiteFile:String = "database.sqlite"
    private let kEntityNameLevel:String = "Level"
    
    init()
    {
        let modelURL:NSURL = NSBundle.mainBundle().URLForResource(kModelName, withExtension:kModelExtension)!
        let storeCoordinatorURL:NSURL = NSFileManager.appDirectory().URLByAppendingPathComponent(kSQLiteFile)
        
        managedObjectModel = NSManagedObjectModel(contentsOfURL:modelURL)!
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel:self.managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:storeCoordinatorURL, options:nil)
        }
        catch{}
        
        managedObjectContext = NSManagedObjectContext(concurrencyType:NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    //MARK: private
    
    private func createLevel() -> DModelLevel
    {
        let entityDescription:NSEntityDescription = NSEntityDescription.entityForName(kEntityNameLevel, inManagedObjectContext:managedObjectContext)!
        let newLevel:DModelLevel = DModelLevel(entity:entityDescription, insertIntoManagedObjectContext:managedObjectContext)
        
        return newLevel
    }
    
    //MARK: public
    
    func saveContext()
    {
        if managedObjectContext.hasChanges
        {
            do
            {
                try managedObjectContext.save()
            }
            catch{}
        }
    }
    
    func fetchLevel() -> DModelLevel
    {
        let fetchRequest:NSFetchRequest = NSFetchRequest(entityName:kEntityNameLevel)
        let results:[DModelLevel]
        let result:DModelLevel
        
        do
        {
            results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [DModelLevel]
        }
        catch
        {
            results = []
        }
        
        if results.isEmpty
        {
            result = createLevel()
        }
        else
        {
            result = results.first!
        }
        
        return result
    }
}