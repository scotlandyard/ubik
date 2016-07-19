import UIKit

class VLanding:UIView
{
    weak var controller:CLanding!
    
    convenience init(controller:CLanding)
    {
        self.init()
        userInteractionEnabled = false
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let logo:UIImageView = UIImageView()
        logo.userInteractionEnabled = false
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = UIViewContentMode.Center
        logo.image = UIImage(named:"logo")
        
        addSubview(logo)
        
        let views:[String:AnyObject] = [
            "logo":logo]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[logo]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[logo]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}