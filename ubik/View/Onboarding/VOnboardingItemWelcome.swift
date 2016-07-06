import UIKit

class VOnboardingItemWelcome:UIView
{
    weak var controller:COnboardingItemWelcome!
    
    convenience init(controller:COnboardingItemWelcome)
    {
        self.init()
        self.controller = controller
    }
}