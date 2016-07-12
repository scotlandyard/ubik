import Foundation
import CoreData

class DManagerModel
{
    private let managedObjectContext:NSManagedObjectContext
    private let kModelExtension:String = "momd"
    private let kSQLiteExtension:String = "%@.sqlite"

    init(modelName:String)
    {
        let modelURL:NSURL = NSBundle.mainBundle().URLForResource(modelName, withExtension:kModelExtension)!
        let sqliteFile:String = String(format:kSQLiteExtension, modelName)
        let storeCoordinatorURL:NSURL = NSFileManager.appDirectory().URLByAppendingPathComponent(sqliteFile)
        let managedObjectModel:NSManagedObjectModel = NSManagedObjectModel(contentsOfURL:modelURL)!
        let persistentStoreCoordinator:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel:managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:storeCoordinatorURL, options:nil)
        }
        catch{}
        
        managedObjectContext = NSManagedObjectContext(concurrencyType:NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    //MARK: public
    
    func saveContext()
    {
        if managedObjectContext.hasChanges
        {
            managedObjectContext.performBlock
            {
                do
                {
                    try self.managedObjectContext.save()
                }
                catch{}
            }
        }
    }
    
    func createManagedObject(entity:String) -> NSManagedObject
    {
        let entityDescription:NSEntityDescription = NSEntityDescription.entityForName(entity, inManagedObjectContext:managedObjectContext)!
        let managedObject:NSManagedObject = NSManagedObject(entity:entityDescription, insertIntoManagedObjectContext: managedObjectContext)
        
        return managedObject
    }
    
    func fetchManagedObjects(entity:String, limit:Int, sorters:[NSSortDescriptor]?) -> [NSManagedObject]
    {
        let fetchRequest:NSFetchRequest = NSFetchRequest(entityName:entity)
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        let results:[NSManagedObject]
        
        do
        {
            results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        }
        catch
        {
            results = []
        }
        
        return results
    }
    
    func fetchLastManagedObject(entity:String) -> NSManagedObject?
    {
        let managedObjects:[NSManagedObject] = fetchManagedObjects(entity, limit:1, sorters:nil)
        
        return managedObjects.last
    }
    
    func delete(object:NSManagedObject)
    {
        managedObjectContext.deleteObject(object)
    }
}