import UIKit

class CSummary:CMainController, MHealthTodayDelegate
{
    weak var viewSummary:VSummary!
    let model:MSummary
    
    init()
    {
        model = MSummary()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
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
        if model.max != nil
        {
            viewSummary.update(model.today, maxValue:model.max!.amount)
        }
    }
    
    private func fetchData()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                self!.model.loadMax()
                MHealth.sharedInstance.loadStepsRemaining(self!)
            }
        }
    }
    
    //MARK: health del
    
    func healthTodaySteps(steps:Int32)
    {
        model.today = steps
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            MConfiguration.sharedInstance.saveSession()
            MHike.sharedInstance.saveSession()
            
            self?.reload()
        }
    }
}