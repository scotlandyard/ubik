import UIKit

class MHistoryItemComponentAmountDistance:MHistoryItemComponent
{
    let distance:String
    private let kCellHeight:CGFloat = 60
    
    init(distance:String)
    {
        self.distance = distance
        let reusableIdentifier:String = VHistoryChartDisplayCellAmount.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = distance
    }
}