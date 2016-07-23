import UIKit

class MHistoryItemComponentAmountDistance:MHistoryItemComponent<VHistoryChartDisplayCellAmount>
{
    let distance:String
    private let kCellHeight:CGFloat = 100
    
    init(distance:String)
    {
        self.distance = distance
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellAmount)
    {
        cell.label.text = distance
    }
}