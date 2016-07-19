import UIKit

class CSummary:CMainController, MHealthLoadDelegate
{
    weak var viewSummary:VSummary!
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        NSNotification.observeBecameActive(self, sel:#selector(self.notifiedBecameActive(sender:)))
        fetchData()
    }
    
    override func loadView()
    {
        let viewSummary:VSummary = VSummary(controller:self)
        self.viewSummary = viewSummary
        view = viewSummary
    }
    
    //MARK: notified
    
    func notifiedBecameActive(sender notification:NSNotification)
    {
        fetchData()
    }
    
    //MARK: private
    
    private func reload()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.viewSummary.update()
        }
    }
    
    private func fetchData()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                MHealth.sharedInstance.loadAll(self!)
            }
        }
    }
    
    //MARK: health del
    
    func healthLoadFinished()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.viewSummary.update()
        }
    }
}