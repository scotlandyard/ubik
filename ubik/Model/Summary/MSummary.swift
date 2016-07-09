import Foundation

class MSummary
{
    let history:[DStepsHike]
    let max:DStepsHike
    var today:Int32
    
    init()
    {
        history = []
        max = DStepsHike()
        today = 0
    }
}