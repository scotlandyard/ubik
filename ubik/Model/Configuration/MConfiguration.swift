import Foundation

class MConfiguration
{
    static let sharedInstance = MConfiguration()
    private(set) var device:DUbikDevice?
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    private init()
    {
    }
    
    //MARK: private
    
    private func firstTime()
    {
        DManager.sharedInstance.managerUbik.createManagedObject(DUbikDevice.self)
        { [weak self] (model) in
            
            self?.device = model
            self?.deviceLoaded()
        }
    }
    
    private func deviceLoaded()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
        device?.newVersion(currentVersion)
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
    
    //MARK: public
    
    func loadSession()
    {
        DManager.sharedInstance.managerUbik.fetchManagedObjects(DUbikDevice.self, limit:1)
        {[weak self] (models) in
            
            if models.isEmpty
            {
                self?.firstTime()
            }
            else
            {
                self?.device = models.first
                self?.deviceLoaded()
            }
        }
    }
    
    func onboardingDone()
    {
        device?.onboardingDone()
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
}