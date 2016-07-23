import UIKit

class MHistory
{
    let items:[MHistoryItem]
    private let kDateFormat:String = "EEEE. MMMM d / yyyy"
    
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
        
        for indexModel:Int in 0 ..< countItems
        {
            let dbItem:DUbikHike = dbModel[indexModel]
            let distanceInt:Int32 = dbItem.distance
            let stepsInt:Int32 = dbItem.steps
            let distanceFloat:CGFloat = CGFloat(distanceInt)
            let stepsFloat:CGFloat = CGFloat(stepsInt)
            let timestamp:NSTimeInterval = dbItem.date
            let dateRaw:NSDate = NSDate(timeIntervalSince1970:timestamp)
            let distance:String = numberFormatter.stringFromNumber(distanceFloat)!
            let steps:String = numberFormatter.stringFromNumber(stepsFloat)!
            let date:String = dateFormatter.stringFromDate(dateRaw)
            let percentage:CGFloat = distanceFloat / maxDistanceFloat
            let ratioFloat:CGFloat = stepsFloat / distanceFloat
            let ratio:String = numberFormatter.stringFromNumber(ratioFloat)!
            
            let item:MHistoryItem = MHistoryItem(distance:distance, steps:steps, ratio:ratio, date:date, percentage:percentage)
            items.append(item)
        }
        
        self.items = items
    }
}