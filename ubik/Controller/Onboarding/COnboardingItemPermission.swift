import UIKit

class COnboardingItemPermission:COnboardingItem, MHealthMainDelegate
{
    override func loadView()
    {
        view = VOnboardingItemPermission(controller:self)
    }
    
    //MARK: public
    
    func askPermission()
    {
        if MHealthMain.sharedInstance.healthStore == nil
        {
            onboarding.next()
        }
        else
        {
            MHealthMain.sharedInstance.askAuthorization(self)
        }
    }
    
    //MARK: health del
    
    func healthAuthorizationAsked()
    {
        onboarding.next()
    }
}