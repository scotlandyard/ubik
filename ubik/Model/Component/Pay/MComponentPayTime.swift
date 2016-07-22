import UIKit

class MComponentPayTime:MComponentPay
{
    private let kSecondsInDay:NSTimeInterval = 86400
    
    init(currentTime:NSTimeInterval)
    {
        let beginingOfToday:NSDate = NSDate().beginningOfDay()
        let today:NSTimeInterval = beginingOfToday.timeIntervalSince1970
        let tomorrow:NSTimeInterval = today + kSecondsInDay
        let remain:NSTimeInterval = tomorrow - currentTime
        let percentage:CGFloat = CGFloat(remain / kSecondsInDay)
        
        let color:UIColor = UIColor.main()
        
        super.init(color:color, percentage:percentage)
    }
}