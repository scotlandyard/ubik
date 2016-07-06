import UIKit

class COnboardingItemWelcome:COnboardingItem
{
    override func loadView()
    {
        view = VOnboardingWelcome(controller:self)
    }
}