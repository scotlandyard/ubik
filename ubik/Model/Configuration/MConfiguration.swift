import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    let onboarding:Bool
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        let managerSession:DManagerModelSession = DManager.sharedInstance.managerSession
        var experience:DSessionExperience? = managerSession.fetchLastManagedObject(managerSession.kEntity_Experience) as? DSessionExperience
        
        if experience == nil
        {
            experience = managerSession.createManagedObject(managerSession.kEntity_Experience) as? DSessionExperience
        }
        
        onboarding = !experience!.onboardingDone
        experience!.version = currentVersion
    }
    
    //MARK: public
    
    func onboardingDone()
    {
        let managerSession:DManagerModelSession = DManager.sharedInstance.managerSession
        let experience:DSessionExperience! = managerSession.fetchLastManagedObject(managerSession.kEntity_Experience) as! DSessionExperience
        experience.onboardingDone = true
        managerSession.saveContext()
    }
}