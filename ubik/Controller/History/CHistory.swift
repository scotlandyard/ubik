import UIKit

class CHistory:CMainController
{
    weak var viewHistory:VHistory!
    var model:MHistory?
    
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
    {
        let sorter:NSSortDescriptor = NSSortDescriptor(key:"date", ascending:false)
        let sorters:[NSSortDescriptor] = [sorter]
        DManager.sharedInstance.managerUbik.fetchManagedObjects(DUbikHike.self, sorters:sorters)
        { [weak self] (models) in
            
            self?.model = MHistory(dbModel:models)
        }
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