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
        MHike.sharedInstance.fetchMaxHike
        { [weak self] (maxHike) in
            
            self?.max = maxHike
        }
    }
}