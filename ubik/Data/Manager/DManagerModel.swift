import Foundation
import CoreData

class DManagerModel
{
    let saver:DManagerSaver
    let managedObjectContext:NSManagedObjectContext
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
        
        saver = DManagerSaver()
        saver.model = self
    }
    
    //MARK: public
    
    func createManagedObject(entity:String, block:(NSManagedObject -> ())?)
    {
        saver.delaySaving()
        
        managedObjectContext.performBlock
        { [weak self] in
                
                if self != nil
                {
                    let entityDescription:NSEntityDescription = NSEntityDescription.entityForName(entity, inManagedObjectContext:self!.managedObjectContext)!
                    let managedObject:NSManagedObject = NSManagedObject(entity:entityDescription, insertIntoManagedObjectContext:self!.managedObjectContext)
                    
                    block?(managedObject)
                }
        }
    }
    
    func createManagedObject(entity:String, delegate:DManagerDelegate?)
    {
        saver.delaySaving()
        
        managedObjectContext.performBlock
        { [weak self] in
                
                if self != nil
                {
                    let entityDescription:NSEntityDescription = NSEntityDescription.entityForName(entity, inManagedObjectContext:self!.managedObjectContext)!
                    let managedObject:NSManagedObject = NSManagedObject(entity:entityDescription, insertIntoManagedObjectContext:self!.managedObjectContext)
                    
                    delegate?.dManagerCreated(managedObject, manager:self!, entity:entity)
                }
        }
    }
    
    func fetchManagedObjects(entity:String, limit:Int, predicate:NSPredicate?, sorters:[NSSortDescriptor]?, delegate:DManagerDelegate?)
    {
        saver.delaySaving()
        let fetchRequest:NSFetchRequest = NSFetchRequest(entityName:entity)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        
        managedObjectContext.performBlock
        { [weak self] in
                
                let results:[NSManagedObject]
                
                do
                {
                    results = try self?.managedObjectContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
                }
                catch
                {
                    results = []
                }
                
                if self != nil
                {
                    delegate?.dManagerFetched(results, manager:self!, entity:entity)
                }
        }
    }
    
    func delete(object:NSManagedObject)
    {
        saver.delaySaving()
        
        managedObjectContext.performBlock
        { [weak self] in
                
                self?.managedObjectContext.deleteObject(object)
        }
    }
}