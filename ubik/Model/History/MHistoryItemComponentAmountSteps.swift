import UIKit

class MHistoryItemComponentAmountSteps:MHistoryItemComponent
{
    let steps:String
    private let kCellHeight:CGFloat = 60
    
    init(steps:String)
    {
        self.steps = steps
        let reusableIdentifier:String = VHistoryChartDisplayCellAmount.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = steps
    }
}