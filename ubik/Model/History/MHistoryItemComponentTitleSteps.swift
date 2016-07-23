import UIKit

class MHistoryItemComponentTitleSteps:MHistoryItemComponent
{
    let title:String
    private let kCellHeight:CGFloat = 18
    
    init()
    {
        title = NSLocalizedString("MHistoryItemComponentTitleSteps_title", comment:"")
        let reusableIdentifier:String = VHistoryChartDisplayCellTitle.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellTitle:VHistoryChartDisplayCellTitle = cell as! VHistoryChartDisplayCellTitle
        cellTitle.label.text = title
    }
}