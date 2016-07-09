import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    private let managerSession:DManagerModelSession
    private(set) var experience:DSessionExperience
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
        managerSession = DManager.sharedInstance.managerSession
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
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
        managerSession.saveContext()
    }
    
    //MARK: public
    
    func onboardingDone()
    {
        experience.onboardingDone = true
        saveSession()
        
        DManager.sharedInstance.managerSteps.saveContext()
    }
    
    func updateLastHike(lastHike:NSTimeInterval)
    {
        experience.lastHike = lastHike
    }
}