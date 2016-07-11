import UIKit

class VHistory:UIView
{
    weak var controller:CHistory!
    
    convenience init(controller:CHistory)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
    }
}