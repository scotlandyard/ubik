import UIKit

class VComponentPay:UIView
{
    let model:MComponentPay
    private var timer:NSTimer?
    private let kTimerInterval:NSTimeInterval = 0.02
    
    init(model:MComponentPay)
    {
        self.model = model
        
        super.init(frame:CGRectZero)
        
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        timer = NSTimer.scheduledTimerWithTimeInterval(kTimerInterval, target:self, selector:#selector(self.tick(sender:)), userInfo:nil, repeats:true)
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        model.loadRect(rect)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, model.color.CGColor)
        CGContextMoveToPoint(context, model.width_2, model.height_2)
        CGContextAddArc(context, model.width_2, model.height_2, model.radius, model.kStartAngle, model.currentAngle, 0)
        CGContextClosePath(context)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
    }
    
    func tick(sender timer:NSTimer)
    {
        if model.tickAndContinue()
        {
            setNeedsDisplay()
        }
        else
        {
            timer.invalidate()
        }
    }
}