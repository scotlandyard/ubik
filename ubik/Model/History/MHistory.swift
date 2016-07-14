import UIKit

class MHistory
{
    let items:[MHistoryItem]
    private let kDateFormat:String = "dd.MM.yy"
    
    init(dbModel:[DStepsHike], maxSteps:Int32)
    {
        var items:[MHistoryItem] = []
        let maxStepsFloat:CGFloat = CGFloat(maxSteps)
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = kDateFormat
        
        let countItems:Int = dbModel.count
        let lastItem:Int = countItems - 1
        
        for indexModel:Int in 0..<countItems
        {
            let dbItem:DStepsHike = dbModel[indexModel]
            let amountInt:Int32 = dbItem.amount
            let amountFloat:CGFloat = CGFloat(amountInt)
            let dateRaw:NSDate = dbItem.date()
            let amount:String = numberFormatter.stringFromNumber(amountFloat)!
            let date:String = dateFormatter.stringFromDate(dateRaw)
            let percentage:CGFloat = amountFloat / maxStepsFloat
            let percentagePrevious:CGFloat
            
            if indexModel < lastItem
            {
                let dbItemPrevious:DStepsHike = dbModel[indexModel + 1]
                let amountIntPrevious:Int32 = dbItemPrevious.amount
                let amountFloatPrevious:CGFloat = CGFloat(amountIntPrevious)
                percentagePrevious = amountFloatPrevious / maxStepsFloat
            }
            else
            {
                percentagePrevious = 0
            }
            
            let item:MHistoryItem = MHistoryItem(amount:amount, date:date, percentage:percentage, percentagePrevious:percentagePrevious)
            items.append(item)
        }
        
        self.items = items
    }
}