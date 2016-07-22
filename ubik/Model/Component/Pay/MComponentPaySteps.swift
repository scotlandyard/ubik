import UIKit

class MComponentPaySteps:MComponentPay
{
    init(currentSteps:CGFloat, maxSteps:CGFloat)
    {
        let percentaje:CGFloat
        
        if maxSteps == 0
        {
            percentaje = currentSteps / maxSteps
        }
        else
        {
            percentaje = 0
        }
        
        let color:UIColor = UIColor.redColor()
        super.init(color:color, percentaje:percentaje)
    }
}