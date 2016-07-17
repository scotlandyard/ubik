import Foundation
import CoreData

protocol DManagerDelegate
{
    func dManagerFetched(results:[NSManagedObject], manager:DManagerModel, entity:String)
    func dManagerCreated(result:NSManagedObject, manager:DManagerModel, entity:String)
}