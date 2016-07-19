import UIKit

class COnboardingItemLoading:COnboardingItem, MHealthLoadDelegate
{
    private var loading:Bool = false
    
    override func viewDidAppear(animated:Bool)
    {
        if !loading
        {
            loading = true
            
            loadSteps()
        }
    }
    
    override func loadView()
    {
        view = VOnboardingItemLoading(controller:self)
    }
    
    //MARK: private
    
    private func goNext()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.onboarding.next()
        }
    }
    
    private func loadSteps()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            MHealth.sharedInstance.loadAll(self)
        }
    }
    
    //MARK: health del
    
    func healthLoadFinished()
    {
        goNext()
    }
}