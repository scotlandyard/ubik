import UIKit

class COnboardingItemReady:COnboardingItem
{
    override func loadView()
    {
        view = VOnboardingItemReady(controller:self)
    }
    
    //MARK: public
    
    func onboardingDone()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            MConfiguration.sharedInstance.onboardingDone()
            MHike.sharedInstance.saveSession()
        }
        
        onboarding.next()
    }
}