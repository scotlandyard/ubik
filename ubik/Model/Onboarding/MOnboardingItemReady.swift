import UIKit

class MOnboardingItemReady:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemReady(onboarding:onboarding)
        
        return controller
    }
}