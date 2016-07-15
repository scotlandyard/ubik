import UIKit

class VHistoryChartSelector:UIView
{
    weak var image:UIImageView!
    
    init()
    {
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.userInteractionEnabled = false
        image.contentMode = UIViewContentMode.Center
        image.image = UIImage(named:"chartSelector")
        
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "image":image]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}