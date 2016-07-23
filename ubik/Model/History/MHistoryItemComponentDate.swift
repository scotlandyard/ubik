import UIKit

class MHistoryItemComponentDate:MHistoryItemComponent<VHistoryChartDisplayCellDate>
{
    let date:String
    private let kCellHeight:CGFloat = 50
    
    init(date:String)
    {
        self.date = date
     
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellDate)
    {
        cell.label.text = date
    }
}