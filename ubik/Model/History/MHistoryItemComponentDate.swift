import UIKit

class MHistoryItemComponentDate:MHistoryItemComponent<VHistoryChartDisplayCellTitle>
{
    let date:String
    private let kCellHeight:CGFloat = 50
    
    init(date:String)
    {
        self.date = date
        
        super.init(cellHeight:kCellHeight)
    }
}