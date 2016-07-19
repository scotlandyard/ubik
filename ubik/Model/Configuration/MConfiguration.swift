import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    weak var managerUbik:DManagerModelUbik!
    private(set) var device:DUbikDevice?
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
        managerUbik = DManager.sharedInstance.managerUbik
        managerUbik.fetchManagedObjects(DUbikDevice.self, entity:"")
        managerUbik.fetchManagedObjects(managerUbik.kEntity_Device, limit:1, predicate:nil, sorters:nil)
        { [weak self] (managedObjects) in
            
            
            
            if managedObjects.isEmpty
            {
                
            }
            else
            {
                self?.device = managedObjects.first
            }
        }
        
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
        experience?.finishedOnboarding()
        saveSession()
    }
    
    func updateStats(lastHike:NSTimeInterval, maxKm:Int32, maxSteps:Int32)
    {
        
        saveSession()
    }
}