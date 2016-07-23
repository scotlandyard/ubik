import UIKit

class MHistoryItemComponentAmountDistance:MHistoryItemComponent
{
    let distance:String
    private let kCellHeight:CGFloat = 100
    
    init(distance:String)
    {
        let reusableIdentifier:String = VHistoryChartDisplayCellAmount.reusableIdentifier()
        self.distance = distance
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
}