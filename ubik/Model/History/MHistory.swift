import UIKit

class MHistory
{
    let items:[MHistoryItem]
    private let kDateFormat:String = "MMMM d / yyyy"
    
    init(dbModel:[DUbikHike])
    {
        let maxDistance:Int32 = MSession.sharedInstance.session!.maxDistance!.distance
        var items:[MHistoryItem] = []
        let maxDistanceFloat:CGFloat = CGFloat(maxDistance)
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = kDateFormat
        let countItems:Int = dbModel.count
        
        for indexModel:Int in 0..<countItems
        {
            let dbItem:DUbikHike = dbModel[indexModel]
            let amountInt:Int32 = dbItem.distance
            let amountFloat:CGFloat = CGFloat(amountInt)
            let timestamp:NSTimeInterval = dbItem.date
            let dateRaw:NSDate = NSDate(timeIntervalSince1970:timestamp)
            let amount:String = numberFormatter.stringFromNumber(amountFloat)!
            let date:String = dateFormatter.stringFromDate(dateRaw)
            let percentage:CGFloat = amountFloat / maxDistanceFloat
            
            let item:MHistoryItem = MHistoryItem(amount:amount, date:date, percentage:percentage)
            items.append(item)
        }
        
        self.items = items
    }
}