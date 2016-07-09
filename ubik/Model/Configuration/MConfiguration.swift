import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    private(set) var experience:DSessionExperience
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        let managerSession:DManagerModelSession = DManager.sharedInstance.managerSession
        var tryExperience:DSessionExperience? = managerSession.fetchLastManagedObject(managerSession.kEntity_Experience) as? DSessionExperience
        
        if tryExperience == nil
        {
            tryExperience = managerSession.createManagedObject(managerSession.kEntity_Experience) as? DSessionExperience
        }
        
        tryExperience!.version = currentVersion
        experience = tryExperience!
    }
    
    //MARK: private
    
    private func saveSession()
    {
        DManager.sharedInstance.managerSession.saveContext()
    }
    
    //MARK: public
    
    func onboardingDone()
    {
        experience.onboardingDone = true
        saveSession()
    }
    
    func updateLastHike(lastHike:NSTimeInterval)
    {
        experience.lastHike = lastHike
        saveSession()
    }
}