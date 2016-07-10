import Foundation

class MSummary
{
    var history:[DStepsHike]
    var max:DStepsHike?
    var today:Int32
    
    init()
    {
        history = []
        today = 0
    }
    
    //MARK: public
    
    func loadHistory()
    {
        history = MHike.sharedInstance.fetchHistory()
        var max:DStepsHike?
        
        for hike in history
        {
            if max == nil
            {
                max = hike
            }
            else
            {
                if hike.amount > max!.amount
                {
                    max = hike
                }
            }
        }
        
        self.max = max
    }
}