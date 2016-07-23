import UIKit

class MHistoryItemComponentAmountSteps:MHistoryItemComponent<VHistoryChartDisplayCellAmount>
{
    let steps:String
    private let kCellHeight:CGFloat = 100
    
    init(steps:String)
    {
        self.steps = steps
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellAmount)
    {
        cell.label.text = steps
    }
}