import UIKit

class VComponentPayBase:UIView
{
    weak var model:MComponentPay?
    
    init()
    {
        super.init(frame:CGRectZero)
        
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        if model != nil
        {
            model!.loadRect(rect)
            
            let context:CGContext = UIGraphicsGetCurrentContext()!
            CGContextSetFillColorWithColor(context, UIColor.complement().CGColor)
            CGContextAddArc(context, model!.width_2!, model!.height_2!, model!.radius!, 0.0001, 0, 0)
            CGContextDrawPath(context, CGPathDrawingMode.Fill)
        }
    }
    
    //MARK: public
    
    func displayModel(model:MComponentPay)
    {
        self.model = model
        setNeedsDisplay()
    }
}