import UIKit

class VComponentGyro:UIView
{
    let model:MComponentGyro
    
    init(model:MComponentGyro)
    {
        self.model = model
        
        super.init(frame:CGRectZero)
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetStrokeColorWithColor(context, model.color.CGColor)
    }
}