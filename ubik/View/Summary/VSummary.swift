import UIKit

class VSummary:UIView
{
    weak var controller:CSummary!
    weak var header:VSummaryHeader!
    weak var footer:VSummaryFooter!
    var modelGyro:MComponentGyro = MComponentGyro.Summary()
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
        
        let header:VSummaryHeader = VSummaryHeader(controller:controller)
        self.header = header
        
        let footer:VSummaryFooter = VSummaryFooter(controller:controller)
        self.footer = footer
        
        addSubview(footer)
        addSubview(header)
        
        let views:[String:AnyObject] = [
            "header":header,
            "footer":footer]
        
        let metrics:[String:AnyObject] = [:]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[header]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[footer]-0-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[header(350)]-0-[footer]-0-|",
            options:[],
            metrics:metrics,
            views:views))
    }
    
    //MARK: public
    
    func update()
    {   
        header.update()
        footer.update()
    }
}