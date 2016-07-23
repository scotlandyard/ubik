import UIKit

class MHistoryItemComponent<CellType:VHistoryChartDisplayCellTitle>
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    init(cellHeight:CGFloat)
    {
        self.cellHeight = cellHeight
        reusableIdentifier = CellType.reusableIdentifier()
    }
    
    //MARK: public
    
    func config(cell:CellType)
    {
        cell.label.text = ""
    }
}