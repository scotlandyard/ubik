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
            let topMax:CGFloat = maxHeight * model!.percentage
            let remainHeight:CGFloat = maxHeight - topMax
            let rect:CGRect = CGRectMake(0, remainHeight, maxWidth, topMax)
            let context:CGContext = UIGraphicsGetCurrentContext()!
            
            CGContextSetFillColorWithColor(context, UIColor.main().CGColor)
            CGContextAddRect(context, rect)
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