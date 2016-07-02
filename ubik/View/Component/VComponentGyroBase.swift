import UIKit

class VComponentGyroBase:UIView
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
            size = height_2 - model.lineWidth
        }
        else
        {
            size = width_2 - model.lineWidth
        }
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetStrokeColorWithColor(context, UIColor.complement().CGColor)
        CGContextAddArc(context, width_2, height_2, size, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}