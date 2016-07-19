import UIKit

extension UILocalNotification
{
    class func cancelAll()
    {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
}