import UIKit

class VSettings:UIView
{
    weak var controller:CSettings!
    
    convenience init(controller:CSettings)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
    }
}