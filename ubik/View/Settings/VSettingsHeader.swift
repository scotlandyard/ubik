import UIKit

class VSettingsHeader:UICollectionReusableView
{
    weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        
        let border:UIView = UIView()
        border.userInteractionEnabled = false
        border.backgroundColor = UIColor(white:0.95, alpha:1)
        border.translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(14)
        label.textColor = UIColor(white:0.5, alpha:1)
        self.label = label
        
        addSubview(border)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "label":label,
            "border":border]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[label]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[border]-10-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[border(1)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}