import UIKit

class MOnboardingItemLoading:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemLoading(onboarding:onboarding)
        
        return controller
    }
}