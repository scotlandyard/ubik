import UIKit

class VHistoryChartCell:UICollectionViewCell
{
    weak var model:MHistoryItem?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func drawRect(rect:CGRect)
    {
        if model != nil
        {
            let maxWidth:CGFloat = rect.maxX
            let maxHeight:CGFloat = rect.maxY
            let topMax:CGFloat = maxWidth * model!.percentage
            let context:CGContext = UIGraphicsGetCurrentContext()!
            CGContextSetLineWidth(context, 1)
            CGContextSetStrokeColorWithColor(context, UIColor.main().CGColor)
            CGContextMoveToPoint(context, 0, 0)
            CGContextAddLineToPoint(context, topMax, 0)
            CGContextAddLineToPoint(context, topMax, maxHeight)
            CGContextAddLineToPoint(context, 0, maxHeight)
            CGContextClosePath(context)
            CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        }
    }
    
    //MARK: public
    
    func config(model:MHistoryItem)
    {
        self.model = model
        setNeedsDisplay()
    }
}