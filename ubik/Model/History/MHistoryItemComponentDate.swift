import UIKit

class MHistoryItemComponentDate:MHistoryItemComponent
{
    let date:String
    private let kCellHeight:CGFloat = 50
    
    init(date:String)
    {
        let reusableIdentifier:String = VHistoryChartDisplayCellDate.reusableIdentifier()
        self.date = date
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellDate:VHistoryChartDisplayCellDate = cell as! VHistoryChartDisplayCellDate
        cellDate.label.text = date
    }
}