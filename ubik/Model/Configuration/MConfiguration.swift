import UIKit
import CoreData

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    private weak var managerSession:DManagerModelSession!
    private(set) var experience:DSessionExperience?
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
    }
    
    //MARK: private
    
    private func firstTime()
    {
        managerSession.createManagedObject(managerSession.kEntity_Experience)
        { [weak self] (managedObject) in
            
            self?.experience = managedObject as? DSessionExperience
            self?.experienceLoaded()
        }
    }
    
    private func experienceLoaded()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        experience?.newVersion(currentVersion)
    }
    
    //MARK: public
    
    func loadSession()
    {
        managerSession = DManager.sharedInstance.managerSession
        managerSession.fetchManagedObjects(managerSession.kEntity_Experience, limit:1, predicate:nil, sorters:nil)
        { [weak self] (managedObjects) in
            
            if managedObjects.isEmpty
            {
                self?.firstTime()
            }
            else
            {
                self?.experience = managedObjects.first as? DSessionExperience
                self?.experienceLoaded()
            }
        }
    }
    
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
    
    //MARK: public
    
    func registerNotifications()
    {
        let settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes:[.Alert, .Badge, .Sound], categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
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