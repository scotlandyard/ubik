import UIKit

class VComponentPay:UIView
{
    init(model:MComponentGyro)
    {
        self.model = model
        currentRadius = kMinRadius
        
        super.init(frame:CGRectZero)
        
        clipsToBounds = true
        userInteractionEnabled = false
        backgroundColor = UIColor.clearColor()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        fatalError()
    }
}