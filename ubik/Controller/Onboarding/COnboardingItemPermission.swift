import UIKit

class COnboardingItemPermission:COnboardingItem, MHealthMainDelegate
{
    private let kWaitingMillis:UInt64 = 300
    
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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC * kWaitingMillis)), dispatch_get_main_queue())
        { [weak self] in
            self?.onboarding.next()
        }
    }
}