import UIKit

class MHistoryItemComponentTitleSteps:MHistoryItemComponent
{
    let title:String
    private let kCellHeight:CGFloat = 40
    
    init()
    {
        title = NSLocalizedString("MHistoryItemComponentTitleSteps_title", comment:"")
        let reusableIdentifier:String = VHistoryChartDisplayCellDate.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellTitle:VHistoryChartDisplayCellTitle = cell as! VHistoryChartDisplayCellTitle
        cellTitle.label.text = title
    }
}