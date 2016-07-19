import Foundation

class DManager
{
    static let sharedInstance = DManager()
    let managerUbik:DManagerModelUbik
    
    private init()
    {
        managerUbik = DManagerModelUbik()
    }
}