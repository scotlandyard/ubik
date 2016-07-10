import UIKit

class COnboardingItemPermission:COnboardingItem, MHealthDelegate
{
    override func loadView()
    {
        view = VOnboardingItemPermission(controller:self)
    }
    
    //MARK: public
    
    func askPermission()
    {
        if MHealth.sharedInstance.healthStore == nil
        {
            onboarding.next()
        }
        else
        {
            MHealth.sharedInstance.askAuthorization(self)
        }
    }
    
    //MARK: health del
    
    func healthAuthorizationAsked()
    {
        dispatch_async(dispatch_get_main_queue())
        {
            self.onboarding.next()
        }
    }
}