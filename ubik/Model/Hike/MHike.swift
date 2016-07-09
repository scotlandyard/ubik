import Foundation

class MHike
{
    static let sharedInstance = MHike()
    private let managerSteps:DManagerModelSteps
    
    private init()
    {
        managerSteps = DManager.sharedInstance.managerSteps
    }
    
    //MARK: public
    
    func saveSession()
    {
        managerSteps.saveContext()
    }
}