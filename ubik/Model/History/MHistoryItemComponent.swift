import UIKit

class MHistoryItemComponent<CellType:VHistoryChartDisplayCell>
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Date(date:String) -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentDate(date:date)
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func AmountDistance(distance:String) -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentAmountDistance(distance:distance)
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func TitleDistance() -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentTitleDistance()
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func AmountSteps(steps:String) -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentAmountSteps(steps:steps)
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func TitleSteps() -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentTitleSteps()
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func Ratio(ratio:String) -> MHistoryItemComponent
    {
        let item:AnyObject = MHistoryItemComponentRatio(ratio:ratio)
        let itemComponent:MHistoryItemComponent = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
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