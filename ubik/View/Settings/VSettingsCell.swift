import UIKit

class VSettingsCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}