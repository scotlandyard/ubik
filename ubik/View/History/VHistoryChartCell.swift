import UIKit

class VHistoryChartCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.main()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}