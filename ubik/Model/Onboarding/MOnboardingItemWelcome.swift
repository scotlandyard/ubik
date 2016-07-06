import UIKit

class MOnboardingItemWelcome:MOnboardingItem
{
    override func controller(onboarding:COnboarding) -> COnboardingItem
    {
        let controller:COnboardingItem = COnboardingItemWelcome(onboarding:onboarding)
        
        return controller
    }
}