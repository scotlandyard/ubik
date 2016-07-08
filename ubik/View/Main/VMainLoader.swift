import UIKit

class VMainLoader:UIImageView
{
    private let kAnimationDuration:NSTimeInterval = 2.5
    
    convenience init()
    {
        self.init()
        
        let images:[UIImage] = [
            UIImage(named:"loader0")!,
            UIImage(named:"loader1")!,
            UIImage(named:"loader2")!,
            UIImage(named:"loader3")!,
            UIImage(named:"loader4")!,
            UIImage(named:"loader5")!
        ]
        
        userInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        animationDuration = kAnimationDuration
        animationImages = images
        
        startAnimating()
    }
}