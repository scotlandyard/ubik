import UIKit

class VSummaryFooterCell:UICollectionViewCell
{
    weak var pay:VComponentPay?
    weak var payBase:VComponentPayBase?
    weak var labelTitle:UILabel!
    weak var labelAmount:UILabel!
    private weak var layoutTitleRight:NSLayoutConstraint!
    private weak var layoutAmountLeft:NSLayoutConstraint!
    private let kPayMidWidth:CGFloat = 45
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
        
        let payBase:VComponentPayBase = VComponentPayBase()
        self.payBase = payBase
        
        let labelTitle:UILabel = UILabel()
        labelTitle.userInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clearColor()
        labelTitle.font = UIFont.bold(22)
        labelTitle.textColor = UIColor.main()
        labelTitle.textAlignment = NSTextAlignment.Right
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.labelTitle = labelTitle
        
        let labelAmount:UILabel = UILabel()
        labelAmount.userInteractionEnabled = false
        labelAmount.backgroundColor = UIColor.clearColor()
        labelAmount.font = UIFont.regular(16)
        labelAmount.textColor = UIColor(white:0.6, alpha:1)
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        self.labelAmount = labelAmount
        
        addSubview(labelAmount)
        addSubview(labelTitle)
        addSubview(payBase)
        
        let views:[String:AnyObject] = [
            "labelTitle":labelTitle,
            "labelAmount":labelAmount,
            "payBase":payBase]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[labelTitle(120)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[labelAmount(120)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelTitle]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[labelAmount]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[payBase]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[payBase]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        
        layoutTitleRight = NSLayoutConstraint(
            item:labelTitle,
            attribute:NSLayoutAttribute.Right,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Right,
            multiplier:1,
            constant:0)
        
        layoutAmountLeft = NSLayoutConstraint(
            item:labelAmount,
            attribute:NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Left,
            multiplier:1,
            constant:0)
        
        addConstraint(layoutTitleRight)
        addConstraint(layoutAmountLeft)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let width_2:CGFloat = width / 2.0
        let titleRight:CGFloat = -(width_2 + kPayMidWidth)
        let amountLeft:CGFloat = width_2 + kPayMidWidth
        
        layoutTitleRight.constant = titleRight
        layoutAmountLeft.constant = amountLeft
    }
    
    //MARK: public
    
    func config(model:MSummaryItem)
    {
        self.pay?.removeFromSuperview()
        payBase?.displayModel(model.pay)
        
        if model.title != nil
        {
            let pay:VComponentPay = VComponentPay(model:model.pay)
            self.pay = pay
            
            addSubview(pay)
            
            let views:[String:AnyObject] = [
                "pay":pay]
            
            let metrics:[String:AnyObject] = [:]
            
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[pay]-0-|",
                options:[],
                metrics:metrics,
                views:views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[pay]-0-|",
                options:[],
                metrics:metrics,
                views:views))
            
            labelTitle.text = model.title
            labelAmount.text = model.amount
        }
    }
}