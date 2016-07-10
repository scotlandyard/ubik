import Foundation

class MSummary
{
    let history:[DStepsHike]
    let max:DStepsHike
    var today:Int32
    
    init()
    {
        history = MHike.sharedInstance.fetchHistory()
        max = DStepsHike()
        today = 0
        
        for hike in history
        {
            print(hike.date())
        }
    }
}