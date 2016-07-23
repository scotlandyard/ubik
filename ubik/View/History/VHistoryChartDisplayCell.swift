import UIKit

class VHistoryChartDisplayCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}