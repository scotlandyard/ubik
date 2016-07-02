import UIKit

class MComponentGyro
{
    let color:UIColor
    let pointerColor:UIColor
    let lineWidth:CGFloat
    let lineWidth_2:CGFloat
    let pointerRadius:CGFloat
    var value:CGFloat
    var maxValue:CGFloat
    var percentValue:CGFloat
    var circleRadius:CGFloat?
    var width_2:CGFloat?
    var height_2:CGFloat?

    class func Summary() -> MComponentGyro
    {
        let model:MComponentGyro = MComponentGyroSummary()
        
        return model
    }
    
    init(lineWidth:CGFloat, pointerRadius:CGFloat, color:UIColor = UIColor.main(), pointerColor:UIColor = UIColor(white:0, alpha:0.1))
    {
        value = 0
        maxValue = 0
        percentValue = 0
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
    
    func update(value:CGFloat, maxValue:CGFloat)
    {
        self.value = value
        self.maxValue = maxValue
        
        if maxValue == 0
        {
            percentValue = 0
        }
        else
        {
            percentValue = value / maxValue
        }
    }
}