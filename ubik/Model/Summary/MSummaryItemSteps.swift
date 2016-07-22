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
        let title:String = NSLocalizedString("MSummaryItemSteps_title", comment:"")
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let amount:String = numberFormatter.stringFromNumber(currentSteps)!
        
        super.init(pay:pay, title:title, amount:amount)
    }
}