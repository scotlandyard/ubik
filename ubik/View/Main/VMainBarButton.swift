import UIKit

class VMainBarButton:UIButton
{
    weak var label:UILabel!
    
    class func History() -> VMainBarButton
    {
        let button:VMainBarButton = VMainBarButtonHistory()
        
        return button
    }
    
    init(image:String, title:String)
    {
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forState:UIControlState.Normal)
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState:UIControlState.Highlighted)
        imageView?.contentMode = UIViewContentMode.Center
        imageView?.tintColor = UIColor.complement()
        imageView?.clipsToBounds = true
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 12, 0)
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blackColor()
        label.text = title
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.regular(11)
        self.label = label
        
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label(13)]-5-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}