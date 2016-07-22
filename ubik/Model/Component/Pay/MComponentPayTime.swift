import UIKit

class MComponentPayTime:MComponentPay
{
    private let kSecondsInDay:NSTimeInterval = 3600
    
    init(currentTime:NSTimeInterval)
    {
        let color:UIColor = UIColor.blueColor()
        let beginingOfToday:NSDate = NSDate().beginningOfDay()
        let today:NSTimeInterval = beginingOfToday.timeIntervalSince1970
        let tomorrow:NSTimeInterval = today + kSecondsInDay
        let remain:NSTimeInterval = tomorrow - currentTime
        let percentaje:CGFloat = CGFloat(remain / kSecondsInDay)
        
        super.init(color:color, percentaje:percentaje)
    }
}