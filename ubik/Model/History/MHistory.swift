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
        
        for dbItem:DStepsHike in dbModel
        {
            let amountInt:Int32 = dbItem.amount
            let amountFloat:CGFloat = CGFloat(amountInt)
            let dateRaw:NSDate = dbItem.date()
            let amount:String = numberFormatter.stringFromNumber(amountFloat)!
            let date:String = dateFormatter.stringFromDate(dateRaw)
            let percentage:CGFloat = amountFloat / maxStepsFloat
            
            let item:MHistoryItem = MHistoryItem(amount:amount, date:date, percentage:percentage)
            items.append(item)
        }
        
        self.items = items
    }
}