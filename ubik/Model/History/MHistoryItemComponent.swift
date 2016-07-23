import UIKit

class MHistoryItemComponent
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Date(date:String) -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentDate(date:date)
        
        return item
    }
    
    class func AmountDistance(distance:String) -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentAmountDistance(distance:distance)
        
        return item
    }
    
    class func TitleDistance() -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentTitleDistance()
        
        return item
    }
    
    class func AmountSteps(steps:String) -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentAmountSteps(steps:steps)
        
        return item
    }
    
    class func TitleSteps() -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentTitleSteps()
        
        return item
    }
    
    class func Ratio(ratio:String) -> MHistoryItemComponent
    {
        let item:MHistoryItemComponent = MHistoryItemComponentRatio(ratio:ratio)
        
        return item
    }
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
    
    //MARK: public
    
    func config(cell:VHistoryChartDisplayCell)
    {
    }
}