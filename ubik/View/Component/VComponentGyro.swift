import UIKit

class VComponentGyro:UIView
{
    let model:MComponentGyro
    
    init(model:MComponentGyro)
    {
        self.model = model
        
        super.init(frame:CGRectZero)
        
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        let width:CGFloat = rect.maxX
        let height:CGFloat = rect.maxY
        let width_2:CGFloat = width / 2
        let height_2:CGFloat = height / 2
        let size:CGFloat
        
        if width > height
        {
            size = height_2 - model.pointerRadius
        }
        else
        {
            size = width_2 - model.pointerRadius
        }
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetStrokeColorWithColor(context, model.color.CGColor)
        CGContextAddArc(context, width_2, height_2, size, 0.0001, 1.8, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}