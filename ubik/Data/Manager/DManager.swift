import Foundation

class DManager
{
    static let sharedInstance = DManager()
    let managerSession:DManagerModelSession
    let managerSteps:DManagerModelSteps
    
    private init()
    {
        managerSession = DManagerModelSession()
        managerSteps = DManagerModelSteps()
    }
}