import Foundation

class MOnboarding
{
    let items:[MOnboardingItem]
    
    init()
    {
        let modelWelcome:MOnboardingItem = MOnboardingItem.Welcome()
        let modelPermission:MOnboardingItem = MOnboardingItem.Permission()
        let modelLoading:MOnboardingItem = MOnboardingItem.Loading()
        let modelReady:MOnboardingItem = MOnboardingItem.Ready()
        
        items = [
            modelWelcome,
            modelPermission,
            modelLoading,
            modelReady
        ]
    }
}