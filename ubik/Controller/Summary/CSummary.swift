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
        print("summary death")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            if self != nil
            {
                self!.model.loadHistory()
                MHealth.sharedInstance.loadStepsRemaining(self!)
            }
        }
    }
    
    override func loadView()
    {
        let viewSummary:VSummary = VSummary(controller:self)
        self.viewSummary = viewSummary
        view = viewSummary
    }
    
    //MARK: functionality
    
    func reload()
    {
        if model.max != nil
        {
            viewSummary.update(model.today, maxValue:model.max!.amount)
        }
    }
    
    //MARK: health del
    
    func healthTodaySteps(steps:Int32)
    {
        model.today = steps
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            MConfiguration.sharedInstance.saveSession()
            MHike.sharedInstance.saveSession()
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.reload()
            }
        }
    }
}