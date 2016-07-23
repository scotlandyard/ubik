import UIKit

class MHistoryItemComponentAmountSteps<CellType:VHistoryChartDisplayCellAmount>:MHistoryItemComponent<CellType>
{
    let steps:String
    private let kCellHeight:CGFloat = 100
    
    init(steps:String)
    {
        self.steps = steps
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:CellType)
    {
        cell.label.text = steps
    }
}