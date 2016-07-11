import UIKit

class VMainBarButton:UIButton
{
    weak var label:UILabel!
    private var active:Bool
    
    class func Summary() -> VMainBarButton
    {
        let button:VMainBarButton = VMainBarButtonSummary()
        
        return button
    }
    
    class func History() -> VMainBarButton
    {
        let button:VMainBarButton = VMainBarButtonHistory()
        
        return button
    }
    
    class func Config() -> VMainBarButton
    {
        let button:VMainBarButton = VMainBarButtonConfig()
        
        return button
    }
    
    init(image:String, title:String)
    {
        active = false
        super.init(frame:CGRectZero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setImage(UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState:UIControlState.Normal)
        imageView?.contentMode = UIViewContentMode.Center
        imageView?.clipsToBounds = true
        imageEdgeInsets = UIEdgeInsetsMake(18, 0, 12, 0)
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        hover()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
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
        let color:UIColor
        
        if active
        {
            color = UIColor.main()
        }
        else if selected || highlighted
        {
            color = UIColor(white:0, alpha:0.1)
        }
        else
        {
            color = UIColor.blackColor()
        }
        
        imageView?.tintColor = color
        label.textColor = color
    }
    
    //MARK: public
    
    func activate()
    {
        userInteractionEnabled = false
        active = true
        hover()
    }
    
    func deactivate()
    {
        userInteractionEnabled = true
        active = false
        hover()
    }
}