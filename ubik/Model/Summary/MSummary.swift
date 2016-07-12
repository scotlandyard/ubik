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
    
    func loadMax()
    {
        max = MHike.sharedInstance.fetchMaxHike()
    }
}