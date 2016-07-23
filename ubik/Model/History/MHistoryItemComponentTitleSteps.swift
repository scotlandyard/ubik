import UIKit

class MHistoryItemComponentTitleSteps<CellType:VHistoryChartDisplayCellTitle>:MHistoryItemComponent<CellType>
{
    let title:String
    private let kCellHeight:CGFloat = 40
    
    init()
    {
        title = NSLocalizedString("MHistoryItemComponentTitleSteps_title", comment:"")
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:CellType)
    {
        cell.label.text = title
    }
}