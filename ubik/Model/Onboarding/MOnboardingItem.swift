import UIKit

class MOnboardingItem
{
    class func Welcome() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemWelcome()
        return model
    }
    
    class func Permission() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemPermission()
        return model
    }
    
    class func Loading() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemLoading()
        return model
    }
    
    class func Ready() -> MOnboardingItem
    {
        let model:MOnboardingItem = MOnboardingItemReady()
        return model
    }
}