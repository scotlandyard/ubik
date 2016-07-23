import UIKit

class MHistoryItemComponentTitleDistance:MHistoryItemComponent
{
    private let kCellHeight:CGFloat = 40
    
    init()
    {
        let reusableIdentifier:String = VHistoryChartDisplayCellTitle.reusableIdentifier()
        self.distance = distance
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = distance
    }
}