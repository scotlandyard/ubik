import UIKit

class MSummaryItemSteps:MSummaryItem
{
    init()
    {
        let currentSteps:CGFloat
        let maxSteps:CGFloat
        let currentStepsInt:Int32? = MSession.sharedInstance.session?.current?.steps
        let maxStepsInt:Int32? = MSession.sharedInstance.session?.maxSteps?.steps
        
        if currentStepsInt == nil || maxStepsInt == nil
        {
            currentSteps = 0
            maxSteps = 0
        }
        else
        {
            currentSteps = CGFloat(currentStepsInt!)
            maxSteps = CGFloat(maxStepsInt!)
        }
        
        let pay:MComponentPay = MComponentPay.Steps(currentSteps, maxSteps:maxSteps)
        super.init(pay:pay)
    }
}