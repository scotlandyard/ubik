import Foundation
import CoreData

class MConfiguration:DManagerDelegate
{
    static let sharedInstance = MConfiguration()
    private weak var managerSession:DManagerModelSession!
    private(set) var experience:DSessionExperience?
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
        managerSession = DManager.sharedInstance.managerSession
        managerSession.fetchManagedObjects(managerSession.kEntity_Experience, limit:1, predicate:nil, sorters:nil, delegate:self)
    }
    
    //MARK: private
    
    private func experienceLoaded()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        experience!.version = currentVersion
    }
    
    //MARK: public
    
    func saveSession()
    {
        managerSession.saver.save(false)
    }
    
    func onboardingDone()
    {
        experience!.onboardingDone = true
        saveSession()
    }
    
    func updateLastHike(lastHike:NSTimeInterval)
    {
        experience!.lastHike = lastHike
        saveSession()
    }
    
    func allowNotifications(allow:Bool)
    {
        experience!.notifications = allow
        saveSession()
    }
    
    //MARK: dmanager delegate
    
    func dManagerFetched(results:[NSManagedObject], manager:DManagerModel, entity:String)
    {
        if results.isEmpty
        {
            managerSession.createManagedObject(managerSession.kEntity_Experience, delegate:self)
        }
        else
        {
            experience = results.first as? DSessionExperience
            experienceLoaded()
        }
    }
    
    func dManagerCreated(result:NSManagedObject, manager:DManagerModel, entity:String)
    {
        experience = result as? DSessionExperience
        experienceLoaded()
    }
}