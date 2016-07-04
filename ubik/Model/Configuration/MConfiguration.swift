import Foundation

class MConfiguration
{
    let onboarding:Bool
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    init()
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
}