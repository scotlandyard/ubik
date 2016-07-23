import UIKit

class MHistoryItemComponentAmountSteps:MHistoryItemComponent
{
    let steps:String
    private let kCellHeight:CGFloat = 100
    
    init(steps:String)
    {
        self.steps = steps
        let reusableIdentifier:String = VHistoryChartDisplayCellDate.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = steps
    }
}