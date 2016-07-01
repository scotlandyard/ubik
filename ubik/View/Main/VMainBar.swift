import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    
    convenience init(controller:CMainParent)
    {
        self.init()
        self.controller = controller
    }
}
