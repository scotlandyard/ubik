import UIKit

extension UILocalNotification
{
    class func cancelAll()
    {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    class func postRemainder()
    {
        self.cancelAll()
        
        if([msettings singleton].notifications)
        {
            UILocalNotification *notification = [snotpollution notification];
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
    }
}