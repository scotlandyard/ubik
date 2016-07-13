import UIKit

class VComponentGyro:UIView
{
    weak var model:MComponentGyro!
    weak var timer:NSTimer?
    private var currentRadius:CGFloat
    private var currentSpeed:CGFloat?
    private var maxRadius:CGFloat?
    private var radiusThreshold:CGFloat?
    private let kTimeInterval:NSTimeInterval = 0.01
    private let kMaxSpeed:CGFloat = 0.01
    private let kMinSpeed:CGFloat = 0.006
    private let kMinRadius:CGFloat = -CGFloat(M_PI_2)
    private let kMaxDegrees:CGFloat = 360
    private let kDegreePerRads:CGFloat = CGFloat(M_PI) / 180.0
    private let kThresholdRads:CGFloat = 0.4
    
    init(model:MComponentGyro)
    {
        self.model = model
        currentRadius = kMinRadius
        
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
    
    deinit
    {
        timer?.invalidate()
    }
    
    override func drawRect(rect:CGRect)
    {
        model.measures(rect)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetStrokeColorWithColor(context, model.color.CGColor)
        CGContextSetFillColorWithColor(context, model.pointerColor.CGColor)
        CGContextAddArc(context, model.width_2!, model.height_2!, model.circleRadius!, kMinRadius, currentRadius, 0)
        
        let point:CGPoint = CGContextGetPathCurrentPoint(context)
        
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        CGContextAddArc(context, point.x, point.y, model.pointerRadius, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
    }
    
    func tick(sender timer:NSTimer)
    {
        switch model.delta
        {
            case MComponentGyro.MComponentGyroDelta.Increase:
                
                tickIncrease()
                
                break
                
            case MComponentGyro.MComponentGyroDelta.Decrease:
                
                tickDecrease()
                
                break
                
            case MComponentGyro.MComponentGyroDelta.None:break
        }
        
        setNeedsDisplay()
    }
    
    //MARK: private
    
    private func tickIncrease()
    {
        if currentRadius < maxRadius!
        {
            currentRadius += currentSpeed!
            
            if currentRadius > radiusThreshold
            {
                currentSpeed = kMinSpeed
            }
        }
        else
        {
            currentRadius = maxRadius!
            timer?.invalidate()
        }
    }
    
    private func tickDecrease()
    {
        if currentRadius > maxRadius!
        {
            currentRadius += currentSpeed!
            
            if currentRadius < radiusThreshold
            {
                currentSpeed = kMinSpeed
            }
        }
        else
        {
            currentRadius = maxRadius!
            timer?.invalidate()
        }
    }
    
    private func thresholds()
    {
        let percentValue:CGFloat = model.percentValue
        
        if percentValue == 0
        {
            maxRadius = kMinRadius
            radiusThreshold = kMinRadius
        }
        else
        {
            let maxRadiusDegrees:CGFloat = kMaxDegrees * percentValue
            let maxRadiusRadian:CGFloat = maxRadiusDegrees * kDegreePerRads
            maxRadius = maxRadiusRadian + kMinRadius
            
            if maxRadius! - kMinRadius > kThresholdRads
            {
                radiusThreshold = maxRadius! - kThresholdRads
            }
            else
            {
                radiusThreshold = kMinRadius
            }
        }
        
        dispatch_async(dispatch_get_main_queue())
        { [weak self] in
            
            if self != nil
            {
                self!.timer = NSTimer.scheduledTimerWithTimeInterval(self!.kTimeInterval, target:self!, selector:#selector(self!.tick(sender:)), userInfo:nil, repeats:true)
            }
        }
    }
    
    private func deltaIncrease()
    {
        currentSpeed = kMaxSpeed
        thresholds()
    }
    
    private func deltaDecrease()
    {
        currentSpeed = -kMaxSpeed
        thresholds()
    }
    
    //MARK: public
    
    func update()
    {
        switch model.delta
        {
            case MComponentGyro.MComponentGyroDelta.Increase:
                
                deltaIncrease()
                
                break
            
            case MComponentGyro.MComponentGyroDelta.Decrease:
                
                deltaDecrease()
                
                break
                
            case MComponentGyro.MComponentGyroDelta.None:
                
                timer?.invalidate()
                
                break
        }
    }
}