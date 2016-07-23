import UIKit

class MHistoryItemComponentAmountDistance<CellType:VHistoryChartDisplayCellAmount>:MHistoryItemComponent<CellType>
{
    let distance:String
    private let kCellHeight:CGFloat = 100
    
    init(distance:String)
    {
        self.distance = distance
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:CellType)
    {
        cell.label.text = distance
    }
}