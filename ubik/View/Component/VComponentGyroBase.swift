import UIKit

class VComponentGyroBase:UIView
{
    weak var model:MComponentGyro!
    
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
        CGContextSetStrokeColorWithColor(context, UIColor.complement().CGColor)
        CGContextAddArc(context, model.width_2!, model.height_2!, model.circleRadius!, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}