import UIKit

class VSummary:UIView
{
    weak var controller:CSummary!
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
    }
}