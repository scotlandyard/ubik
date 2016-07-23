import UIKit

class VHistoryChartDisplayCellImage:VHistoryChartDisplayCell
{
    weak var label:UILabel!
    weak var title:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let image:UIImageView = UIImageView()
        image.clipsToBounds = true
        image.contentMode = UIViewContentMode.Center
        image.userInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"circle")
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.numeric(20)
        label.textColor = UIColor.whiteColor()
        self.label = label
        
        let title:UILabel = UILabel()
        title.userInteractionEnabled = false
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = UIColor.clearColor()
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.regular(14)
        title.textColor = UIColor.complementDarker()
        self.title = title
        
        image.addSubview(label)
        addSubview(title)
        addSubview(image)
        
        let views:[String:AnyObject] = [
            "label":label,
            "title":title,
            "image":image]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[title]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[image]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[title(20)]-0-|",
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