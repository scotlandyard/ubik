import UIKit

class COnboardingItemPermission:COnboardingItem
{
    override func loadView()
    {
        view = VOnboardingItemPermission(controller:self)
    }
    
    //MARK: public
    
    func askPermission()
    {
        if MHealthMain.sharedInstance.healthStore != nil
        {
            onboarding.next()
        }
    }
}