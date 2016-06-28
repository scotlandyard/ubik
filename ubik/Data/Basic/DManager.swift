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
}