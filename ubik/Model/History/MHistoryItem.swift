import UIKit

class MHistoryItem
{
    let percentage:CGFloat
    let components:[MHistoryItemComponent]
    
    init(distance:String, steps:String, ratio:String, date:String, percentage:CGFloat)
    {
        self.percentage = percentage
        
        let itemDate:MHistoryItemComponent = MHistoryItemComponent.Date(date)
        let itemAmountDistance:MHistoryItemComponent = MHistoryItemComponent.AmountDistance(distance)
        let itemTitleDistance:MHistoryItemComponent = MHistoryItemComponent.TitleDistance()
        let itemAmountSteps:MHistoryItemComponent = MHistoryItemComponent.AmountSteps(steps)
        let itemTitleSteps:MHistoryItemComponent = MHistoryItemComponent.TitleSteps()
        let itemRatio:MHistoryItemComponent = MHistoryItemComponent.Ratio(ratio)
        
        components = [
            itemDate,
            itemAmountDistance,
            itemTitleDistance,
            itemAmountSteps,
            itemTitleSteps,
            itemRatio
        ]
    }
}