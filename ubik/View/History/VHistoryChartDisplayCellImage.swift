import UIKit

class VHistoryChartDisplayCellImage:VHistoryChartDisplayCell
{
    weak var label:UILabel!
    weak var title:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.numeric(15)
        label.textColor = UIColor.whiteColor()
        self.label = label
        
        let title:UILabel = UILabel()
        title.userInteractionEnabled = false
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = UIColor.clearColor()
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.regular(12)
        title.textColor = UIColor.complementDark()
        self.title = title
        
        addSubview(label)
        addSubview(title)
        
        let views:[String:AnyObject] = [
            "label":label,
            "title":title]
        
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
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[title]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}