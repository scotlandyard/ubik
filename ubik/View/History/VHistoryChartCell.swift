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
            let bottomMax:CGFloat = maxWidth * model!.percentagePrevious
            let context:CGContext = UIGraphicsGetCurrentContext()!
            CGContextSetFillColorWithColor(context, UIColor.main().CGColor)
            CGContextMoveToPoint(context, 0, 0)
            CGContextAddLineToPoint(context, topMax, 0)
            CGContextAddLineToPoint(context, bottomMax, maxHeight)
            CGContextAddLineToPoint(context, 0, maxHeight)
            CGContextClosePath(context)
            CGContextDrawPath(context, CGPathDrawingMode.Fill)
        }
    }
    
    //MARK: public
    
    func config(model:MHistoryItem)
    {
        self.model = model
        setNeedsDisplay()
    }
}