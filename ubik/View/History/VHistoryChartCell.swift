import UIKit

class VHistoryChartCell:UICollectionViewCell
{
    weak var model:MHistoryItem?
    private var color:UIColor
    
    override init(frame:CGRect)
    {
        color = UIColor.clearColor()
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
            
            CGContextSetFillColorWithColor(context, color.CGColor)
            CGContextAddRect(context, rect)
            CGContextDrawPath(context, CGPathDrawingMode.Fill)
        }
    }
    
    override var selected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var highlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if selected || highlighted
        {
            color = UIColor.blackColor()
        }
        else
        {
            color = UIColor.main()
        }
        
        setNeedsDisplay()
    }
    
    //MARK: public
    
    func config(model:MHistoryItem)
    {
        self.model = model
        hover()
    }
}