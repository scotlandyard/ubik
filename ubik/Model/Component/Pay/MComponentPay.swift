import UIKit

class MComponentPay
{
    let color:UIColor
    private(set) var radius:CGFloat?
    private(set) var width_2:CGFloat?
    private(set) var height_2:CGFloat?
    private let kMargin:CGFloat = 4
    
    class func Steps() -> MComponentPay
    {
        let model:MComponentPay = MComponentPaySteps()
        
        return model
    }
    
    class func Time() -> MComponentPay
    {
        let model:MComponentPay = MComponentPayTime()
        
        return model
    }
    
    init(color:UIColor)
    {
        self.color = color
    }
    
    //MARK: public
    
    func loadRect(rect:CGRect)
    {
        if radius == nil
        {
            let width:CGFloat = rect.width
            let height:CGFloat = rect.height
            width_2 = width / 2.0
            height_2 = height / 2.0
            
            if width > height
            {
                radius = height_2! - kMargin
            }
            else
            {
                radius = width_2! - kMargin
            }
        }
    }
}