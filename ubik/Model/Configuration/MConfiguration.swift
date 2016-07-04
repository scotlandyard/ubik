import Foundation

class MConfiguration
{
    let firstTime:Bool
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    init()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        
        let managerSession:DManagerModelSession = DManager.sharedInstance.managerSession
        
        var tryExperience:DObjectSessionExperience? = managerSession.fetchLastManagedObject(managerSession.kEntity_Experience) as? DObjectSessionExperience
        
        if tryExperience == nil
        {
            tryExperience = managerSession.createManagedObject(managerSession.kEntity_Device) as? DObjectSessionExperience
        }
    }
}