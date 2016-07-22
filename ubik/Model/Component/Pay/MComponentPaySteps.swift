import UIKit

class MComponentPaySteps:MComponentPay
{
    init(currentSteps:CGFloat, maxSteps:CGFloat)
    {
        let percentage:CGFloat
        
        if maxSteps == 0
        {
            percentage = 0
        }
        else
        {
            percentage = currentSteps / maxSteps
        }
        
        let color:UIColor = UIColor.main()
        super.init(color:color, percentage:percentage)
    }
}