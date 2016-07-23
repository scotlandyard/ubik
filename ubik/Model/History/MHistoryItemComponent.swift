import UIKit

class MHistoryItemComponent<CellType:VHistoryChartDisplayCell>
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Date(date:String) -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentDate(date:date)
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func AmountDistance(distance:String) -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentAmountDistance(distance:distance)
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func TitleDistance() -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentTitleDistance()
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func AmountSteps(steps:String) -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentAmountSteps(steps:steps)
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func TitleSteps() -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentTitleSteps()
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
        return itemComponent
    }
    
    class func Ratio(ratio:String) -> MHistoryItemComponent<CellType>
    {
        let item:AnyObject = MHistoryItemComponentRatio(ratio:ratio)
        let itemComponent:MHistoryItemComponent<CellType> = item as! MHistoryItemComponent
        
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