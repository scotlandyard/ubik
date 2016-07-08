import UIKit

class COnboardingItemPermission:COnboardingItem
{
    override func loadView()
    {
        view = VOnboardingItemWelcome(controller:self)
    }
}