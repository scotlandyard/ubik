import UIKit

class VComponentGyroIcon:UIView
{
    let model:MComponentGyro
    weak var layoutIconTop:NSLayoutConstraint!
    
    init(model:MComponentGyro)
    {
        self.model = model
        
        super.init(frame:CGRectZero)
        
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
        
        let image:UIImageView = UIImageView()
        image.userInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.Center
        image.image = UIImage(named:"gyroIcon")
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image]
        
        let metrics:[String:AnyObject] = [
            "iconHeight":model.lineWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[image(iconHeight)]",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutIconTop = NSLayoutConstraint(
            item:image,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Top,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutIconTop)
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        model.measures(bounds)
        
        let iconTop:CGFloat = model.height_2! - model.circleRadius! - model.lineWidth_2
        layoutIconTop.constant = iconTop
        
        super.layoutSubviews()
    }
    
    override func drawRect(rect:CGRect)
    {
        let width:CGFloat = rect.maxX
        let height:CGFloat = rect.maxY
        let width_2:CGFloat = width / 2
        let height_2:CGFloat = height / 2
        let size:CGFloat
        
        if width > height
        {
            size = height_2 - model.lineWidth
        }
        else
        {
            size = width_2 - model.lineWidth
        }
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, model.lineWidth)
        CGContextSetStrokeColorWithColor(context, UIColor.complement().CGColor)
        CGContextAddArc(context, width_2, height_2, size, 0.0001, 0, 0)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}