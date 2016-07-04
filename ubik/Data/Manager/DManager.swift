import Foundation

class DManager
{
    static let sharedInstance = DManager()
    let managerSession:DManagerModelSession
    
    private init()
    {
        managerSession = DManagerModelSession()
    }
}