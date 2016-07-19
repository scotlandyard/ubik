import Foundation

class MSession
{
    static let sharedInstance = MSession()
    private weak var main:CMainParent?
    private(set) var session:DUbikSession?
    
    private init()
    {
    }
    
    //MARK: private
    
    private func sessionFirstTime()
    {
        DManager.sharedInstance.managerUbik.createManagedObject(DUbikSession.self)
        { [weak self] (model) in
            
            self?.session = model
            
            DManager.sharedInstance.managerUbik.saver.save(false)
            
            self?.main?.sessionLoaded()
        }
    }
    
    //MARK: public
    
    func loadSession(main:CMainParent)
    {
        self.main = main
        
        DManager.sharedInstance.managerUbik.fetchManagedObjects(DUbikSession.self, limit:1)
        { [weak self] (models) in
            
            if models.isEmpty
            {
                self?.sessionFirstTime()
            }
            else
            {
                self?.session = models.first
                self?.main?.sessionLoaded()
            }
        }
    }
    
    func newMaxDistance(maxDistance:DUbikHike)
    {
        session?.newMaxDistance(maxDistance)
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
    
    func newMaxSteps(maxSteps:DUbikHike)
    {
        session?.newMaxSteps(maxSteps)
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
    
    func newCurrent(current:DUbikHike)
    {
        session?.newCurrent(current)
        DManager.sharedInstance.managerUbik.saver.save(false)
    }
}