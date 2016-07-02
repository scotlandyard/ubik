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
        model.measures(rect)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetStrokeColorWithColor(context, model.color.CGColor)
        CGContextSetFillColorWithColor(context, model.pointerColor.CGColor)
        CGContextAddArc(context, model.width_2!, model.height_2!, model.circleRadius!, -CGFloat(M_PI_2), 1.8, 0)
        
        let point:CGPoint = CGContextGetPathCurrentPoint(context)
        
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        CGContextAddArc(context, point.x, point.y, model.pointerRadius, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
    }
}