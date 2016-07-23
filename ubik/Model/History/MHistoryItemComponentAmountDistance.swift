import UIKit

class MHistoryItemComponentAmountDistance:MHistoryItemComponent
{
    let distance:String
    private let kCellHeight:CGFloat = 100
    
    init(distance:String)
    {
        self.distance = distance
        let reusableIdentifier:String = VHistoryChartDisplayCellDate.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = distance
    }
}