import Foundation

class MSummary
{
    let history:[DStepsHike]
    let max:DStepsHike?
    var today:Int32
    
    init()
    {
        history = MHike.sharedInstance.fetchHistory()
        today = 0
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