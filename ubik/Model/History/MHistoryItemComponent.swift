import UIKit

class MHistoryItemComponent
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
    
    //MARK: public
    
    func config(cell:VHistoryChartCell)
    {
        
    }
}