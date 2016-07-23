import UIKit

class MHistoryItemComponent<CellType:VHistoryChartDisplayCell>
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
    }
}