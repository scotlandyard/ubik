import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.complement()
        clipsToBounds = true
        self.controller = controller
    }
}
