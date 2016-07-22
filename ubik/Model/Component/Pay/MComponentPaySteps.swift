import UIKit

class MComponentPaySteps:MComponentPay
{
    init(currentSteps:CGFloat, maxSteps:CGFloat)
    {
        let percentaje:CGFloat
        
        if maxSteps == 0
        {
            percentaje = 0
        }
        else
        {
            percentaje = currentSteps / maxSteps
        }
        
        let color:UIColor = UIColor.main()
        super.init(color:color, percentaje:percentaje)
    }
}