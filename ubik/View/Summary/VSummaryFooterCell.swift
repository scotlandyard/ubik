import UIKit

class VSummaryFooterCell:UICollectionViewCell
{
    weak var pay:VComponentPay?
    weak var payBase:VComponentPayBase?
    private let kPayWidth:CGFloat = 160
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let payBase:VComponentPayBase = VComponentPayBase()
        self.payBase = payBase
        
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
        payBase?.displayModel(model.pay)
        
        let pay:VComponentPay = VComponentPay(model:model.pay)
        self.pay = pay
        
        addSubview(pay)
        
        let views:[String:AnyObject] = [
            "pay":pay]
        
        let metrics:[String:AnyObject] = [
            "payWidth":kPayWidth]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[pay(payWidth)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[pay]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
}