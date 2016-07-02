import UIKit

class MComponentGyro
{
    let color:UIColor
    let pointerColor:UIColor
    let value:CGFloat
    let maxValue:CGFloat
    let lineWidth:CGFloat
    let lineWidth_2:CGFloat
    let pointerRadius:CGFloat
    var circleRadius:CGFloat?
    var width_2:CGFloat?
    var height_2:CGFloat?

    class func Summary() -> MComponentGyro
    {
        let model:MComponentGyro = MComponentGyroSummary()
        
        return model
    }
    
    class func Summary(value:CGFloat, maxValue:CGFloat) -> MComponentGyro
    {
        let model:MComponentGyro = MComponentGyroSummary(value:value, maxValue:maxValue)
        
        return model
    }
    
    init(value:CGFloat, maxValue:CGFloat, lineWidth:CGFloat, pointerRadius:CGFloat, color:UIColor = UIColor.main(), pointerColor:UIColor = UIColor(white:0, alpha:0.1))
    {
        self.value = value
        self.maxValue = maxValue
        self.lineWidth = lineWidth
        self.pointerRadius = pointerRadius
        self.color = color
        self.pointerColor = pointerColor
        lineWidth_2 = lineWidth / 2
    }
    
    //MARK: public
    
    func measures(rect:CGRect)
    {
        if circleRadius == nil
        {
            let width:CGFloat = rect.maxX
            let height:CGFloat = rect.maxY
            width_2 = width / 2
            height_2 = height / 2
            
            if width > height
            {
                circleRadius = height_2! - lineWidth
            }
            else
            {
                circleRadius = width_2! - lineWidth
            }
        }
    }
}