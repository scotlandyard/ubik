import UIKit

class MOnboardingItemPermission:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemPermission(onboarding:onboarding)
        
        return controller
    }
}