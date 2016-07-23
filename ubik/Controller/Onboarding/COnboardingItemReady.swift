import UIKit

class COnboardingItemReady:COnboardingItem
{
    override func loadView()
    {
        view = VOnboardingItemReady(controller:self)
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let settings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes:[.Alert, .Badge, .Sound], categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    //MARK: public
    
    func onboardingDone()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            MConfiguration.sharedInstance.onboardingDone()
        }
        
        onboarding.next()
    }
}