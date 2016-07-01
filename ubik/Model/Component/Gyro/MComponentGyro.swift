import UIKit

class MComponentGyro
{
    let color:UIColor
    let value:Double
    let maxValue:Double
    
    class func Summary(value:Double, maxValue:Double) -> MComponentGyro
    {
        let color:UIColor = UIColor.main()
        let model:MComponentGyro = MComponentGyroSummary(value:value, maxValue:maxValue, color:color)
        
        return model
    }
    
    init(value:Double, maxValue:Double, color:UIColor)
    {
        self.color = color
        self.value = value
        self.maxValue = maxValue
    }
}