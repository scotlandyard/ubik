import UIKit

class MHistoryItem
{
    let percentage:CGFloat
    let components:[MHistoryItemComponent<VHistoryChartDisplayCell>]
    
    init(distance:String, steps:String, ratio:String, date:String, percentage:CGFloat)
    {
        self.percentage = percentage
        
        let itemDate:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.Date(date)
        let itemAmountDistance:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.AmountDistance(distance)
        let itemTitleDistance:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.TitleDistance()
        let itemAmountSteps:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.AmountSteps(steps)
        let itemTitleSteps:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.TitleSteps()
        let itemRatio:MHistoryItemComponent<VHistoryChartDisplayCell> = MHistoryItemComponent.Ratio(ratio)
        
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