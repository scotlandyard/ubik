import UIKit

class COnboardingItem:CMainController
{
    weak var onboarding:COnboarding!
    
    init(onboarding:COnboarding)
    {
        super.init(nibName:nil, bundle:nil)
        self.onboarding = onboarding
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
}