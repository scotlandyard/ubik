import UIKit

class CHistory:CMainController
{
    weak var viewHistory:VHistory!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        {
            self.loadModel()
        }
    }
    
    override func loadView()
    {
        let viewHistory:VHistory = VHistory(controller:self)
        self.viewHistory = viewHistory
        view = viewHistory
    }
    
    //MARK: private
    
    private func loadModel()
    {/*
        MHike.sharedInstance.fetchMaxHike
        { [weak self] (maxHike) in
            
            let maxHikeNum:Int32
            
            if maxHike == nil
            {
                maxHikeNum = 1
            }
            else
            {
                maxHikeNum = maxHike!.amount
            }
            
            self?.maxHikeLoaded(maxHikeNum)
        }*/
    }
    
    private func maxHikeLoaded(maxHikeNum:Int32)
    {/*
        MHike.sharedInstance.fetchHistory
        { (history) in
            
            let model:MHistory = MHistory(dbModel:history, maxSteps:maxHikeNum)
            
            dispatch_async(dispatch_get_main_queue())
            { [weak self] in
                
                self?.viewHistory.chart.modelLoaded(model)
            }
        }*/
    }
}