import UIKit

class VSettingsCellCheck:VSettingsCell
{
    weak var check:UISwitch!
    weak var label:UILabel!
    let attrTitle:[String:AnyObject]
    let attrSubtitle:[String:AnyObject]
    
    override init(frame:CGRect)
    {
        attrTitle = [NSFontAttributeName:UIFont.bold(15), NSForegroundColorAttributeName:UIColor(white:0.2, alpha:1)]
        attrSubtitle = [NSFontAttributeName:UIFont.regular(14), NSForegroundColorAttributeName:UIColor(white:0.4, alpha:1)]
        
        super.init(frame:frame)
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.onTintColor = UIColor.main()
        self.check = check
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 0
        self.label = label
        
        addSubview(check)
        addSubview(label)
        
        let views:[String:AnyObject] = [
            "check":check,
            "label":label]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[label]-0-[check(90)]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[check]-20-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[label]-20-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}