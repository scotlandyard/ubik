import UIKit

class MComponentPay
{
    let color:UIColor
    let kStartAngle:CGFloat = -CGFloat(M_PI_2)
    private(set) var radius:CGFloat!
    private(set) var width_2:CGFloat!
    private(set) var height_2:CGFloat!
    private(set) var currentAngle:CGFloat
    private let expectedAngle:CGFloat
    private let kMargin:CGFloat = 30
    private let kTotalRadius:CGFloat = 360
    private let kAngleDelta:CGFloat = 0.05
    
    class func Steps(currentSteps:CGFloat, maxSteps:CGFloat) -> MComponentPay
    {
        let model:MComponentPay = MComponentPaySteps(currentSteps:currentSteps, maxSteps:maxSteps)
        
        return model
    }
    
    class func Time(currentTime:NSTimeInterval) -> MComponentPay
    {
        let model:MComponentPay = MComponentPayTime(currentTime:currentTime)
        
        return model
    }
    
    init(color:UIColor, percentaje:CGFloat)
    {
        self.color = color
        currentAngle = kStartAngle
        
        let percentRadius:CGFloat = kTotalRadius * percentaje
        let radiusRadians:CGFloat = percentRadius * CGFloat(M_PI) / 180.0
        expectedAngle = radiusRadians + kStartAngle
    }
    
    //MARK: public
    
    func loadRect(rect:CGRect)
    {
        if radius == nil
        {
            let width:CGFloat = rect.width
            let height:CGFloat = rect.height
            width_2 = width / 2.0
            height_2 = height / 2.0
            
            if width > height
            {
                radius = height_2! - kMargin
            }
            else
            {
                radius = width_2! - kMargin
            }
        }
    }
    
    func tickAndContinue() -> Bool
    {
        let shouldContinue:Bool
        currentAngle += kAngleDelta
        
        if currentAngle > expectedAngle
        {
            currentAngle = expectedAngle
            shouldContinue = false
        }
        else
        {
            shouldContinue = true
        }
        
        return shouldContinue
    }
}