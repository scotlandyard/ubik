import UIKit

class MComponentPayTime:MComponentPay
{
    private let kSecondsInDay:NSTimeInterval = 86400
    
    init(currentTime:NSTimeInterval)
    {
        let color:UIColor = UIColor.blueColor()
        let beginingOfToday:NSDate = NSDate().beginningOfDay()
        let today:NSTimeInterval = beginingOfToday.timeIntervalSince1970
        let transcurred:NSTimeInterval = currentTime - today
        let percentaje:CGFloat = CGFloat(transcurred / kSecondsInDay)
        
        super.init(color:color, percentaje:percentaje)
    }
}