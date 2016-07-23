import UIKit

class MHistoryItemComponentDate<CellType:VHistoryChartDisplayCellTitle>:MHistoryItemComponent<CellType>
{
    let date:String
    private let kCellHeight:CGFloat = 50
    
    init(date:String)
    {
        self.date = date
     
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:CellType)
    {
        cell.label.text = date
    }
}