import UIKit

class VSummaryFooterCell:UICollectionViewCell
{
    weak var pay:VComponentPay?
    private let kPayWidth:CGFloat = 160
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let payBase:VComponentPayBase = VComponentPayBase()
        
        addSubview(payBase)
        
        let views:[String:AnyObject] = [
            "payBase":payBase]
        
        let metrics:[String:AnyObject] = [
            "payWidth":kPayWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[payBase(payWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[payBase]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func config(model:MSummaryItem)
    {
        self.pay?.removeFromSuperview()
    }
}