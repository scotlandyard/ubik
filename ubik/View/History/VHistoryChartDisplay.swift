import UIKit

class VHistoryChartDisplay:UIView
{
    weak var labelDate:UILabel!
    weak var labelAmount:UILabel!
    
    
    init()
    {
        super.init(frame:CGRectZero)
        userInteractionEnabled = false
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelDate:UILabel = UILabel()
        labelDate.userInteractionEnabled = false
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.backgroundColor = UIColor.clearColor()
        labelDate.font = UIFont.regular(14)
        labelDate.textAlignment = NSTextAlignment.Center
        labelDate.textColor = UIColor(white:0.7, alpha:1)
        self.labelDate = labelDate
        
        let labelAmount:UILabel = UILabel()
        labelAmount.userInteractionEnabled = false
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.backgroundColor = UIColor.clearColor()
        labelAmount.font = UIFont.numeric(20)
        labelAmount.textAlignment = NSTextAlignment.Center
        labelAmount.textColor = UIColor.main()
        self.labelAmount = labelAmount
        
        addSubview(labelDate)
        addSubview(labelAmount)
        
        let views:[String:AnyObject] = [
            "labelDate":labelDate,
            "labelAmount":labelAmount]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelDate]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[labelAmount]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[labelDate(30)]-0-[labelAmount(50)]",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func hikeSelected(model:MHistoryItem)
    {
        labelDate.text = model.date
        labelAmount.text = model.amount
    }
}