import UIKit

class MHistory
{
    let items:[MHistoryItem]
    private let kDateFormat:String = "MMMM d / yyyy"
    
    init(dbModel:[AnyObject], maxSteps:Int32)
    {/*
        var items:[MHistoryItem] = []
        let maxStepsFloat:CGFloat = CGFloat(maxSteps)
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = kDateFormat
        let countItems:Int = dbModel.count
        
        for indexModel:Int in 0..<countItems
        {
            let dbItem:DStepsHike = dbModel[indexModel]
            let amountInt:Int32 = dbItem.amount
            let amountFloat:CGFloat = CGFloat(amountInt)
            let dateRaw:NSDate = dbItem.date()
            let amount:String = numberFormatter.stringFromNumber(amountFloat)!
            let date:String = dateFormatter.stringFromDate(dateRaw)
            let percentage:CGFloat = amountFloat / maxStepsFloat
            
            let item:MHistoryItem = MHistoryItem(amount:amount, date:date, percentage:percentage)
            items.append(item)
        }
        
        self.items = items*/
        items = []
    }
}