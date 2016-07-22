import UIKit

class VComponentPayBase:UIView
{
    let model:MComponentPay
    
    init(model:MComponentPay)
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
        model.loadRect(rect)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, UIColor(white:0.98, alpha:1).CGColor)
        CGContextAddArc(context, model.width_2!, model.height_2!, model.radius!, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
    }
}