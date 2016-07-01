import UIKit

class MComponentGyro
{
    let color:UIColor
    let value:CGFloat
    let maxValue:CGFloat
    let lineWidth:CGFloat

    class func Summary(value:CGFloat, maxValue:CGFloat) -> MComponentGyro
    {
        let model:MComponentGyro = MComponentGyroSummary(value:value, maxValue:maxValue)
        
        return model
    }
    
    init(value:CGFloat, maxValue:CGFloat, lineWidth:CGFloat, color:UIColor = UIColor.main())
    {
        self.value = value
        self.maxValue = maxValue
        self.lineWidth = lineWidth
        self.color = color
    }
}