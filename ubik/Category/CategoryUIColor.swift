import UIKit

extension UIColor
{
    class func main() -> UIColor
    {
        return UIColor(red:1, green:0.3, blue:0.2, alpha:1)
    }
    
    class func complement() -> UIColor
    {
        return UIColor(red:0.94, green:0.96, blue:0.98, alpha:1)
    }
    
    class func complementDark() -> UIColor
    {
        return UIColor(red:0.7, green:0.77, blue:0.85, alpha:1)
    }
    
    class func complementDarker() -> UIColor
    {
        return UIColor(red:0.5, green:0.6, blue:0.7, alpha:1)
    }
}