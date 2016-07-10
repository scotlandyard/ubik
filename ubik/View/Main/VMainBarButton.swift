import UIKit

class VMainBarButton:UIButton
{
    class func History() -> VMainBarButton
    {
        let button:VMainBarButton = VMainBarButtonHistory()
        
        return button
    }
    
    init(image:String)
    {
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forState:UIControlState.Normal)
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState:UIControlState.Highlighted)
        imageView?.contentMode = UIViewContentMode.Center
        imageView?.tintColor = UIColor.complement()
        imageView?.clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}