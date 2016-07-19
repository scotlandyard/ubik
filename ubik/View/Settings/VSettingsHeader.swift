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
        
        let label:UILabel = UILabel()
        label.userInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.regular(14)
        label.textColor = UIColor(white:0.5, alpha:1)
        self.label = label
        
        addSubview(label)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}