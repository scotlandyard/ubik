import Foundation

class DManagerSaver
{
    weak var model:DManagerModel!
    weak var timer:NSTimer?
    private let kTimeoutSave:NSTimeInterval = 1.5
    
    init()
    {
    }
    
    @objc func timerDone(sender timer:NSTimer)
    {
        timer.invalidate()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        { [weak self] in
            
            self?.saveModel()
            self?.timer = nil
        }
    }
    
    //MARK: private
    
    private func saveModel()
    {
        model.forceSaveContext()
    }
    
    //MARK: public
    
    func save()
    {
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            self?.timer?.invalidate()
            
            if self != nil
            {
                self!.timer = NSTimer.scheduledTimerWithTimeInterval(self!.kTimeoutSave, target:self!, selector:#selector(self!.timerDone(sender:)), userInfo:nil, repeats:false)
            }
        }
    }
    
    func delaySaving()
    {
        if timer != nil
        {
            save()
        }
    }
}