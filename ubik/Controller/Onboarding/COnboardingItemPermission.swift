import UIKit

class COnboardingItemPermission:COnboardingItem, MHealthAuthDelegate
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
            onboarding.parent.healthKitError()
        }
        else
        {
            dispatch_async(dispatch_get_main_queue())
            {
                MHealth.sharedInstance.askAuthorization(self)
            }
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