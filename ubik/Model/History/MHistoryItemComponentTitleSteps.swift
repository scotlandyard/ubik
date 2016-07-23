import UIKit

class MHistoryItemComponentTitleSteps:MHistoryItemComponent<VHistoryChartDisplayCellTitle>
{
    let title:String
    private let kCellHeight:CGFloat = 40
    
    init()
    {
        title = NSLocalizedString("MHistoryItemComponentTitleSteps_title", comment:"")
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellTitle)
    {
        cell.label.text = title
    }
}