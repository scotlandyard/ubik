import UIKit

class MComponentPayEmpty:MComponentPay
{
    init()
    {
        let color:UIColor = UIColor.clearColor()
        
        super.init(color:color, percentage:0)
    }
}