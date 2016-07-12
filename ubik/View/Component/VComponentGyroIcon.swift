import UIKit

class VComponentGyroIcon:UIView
{
    weak var model:MComponentGyro!
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
            "V:[image(iconHeight)]",
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
}