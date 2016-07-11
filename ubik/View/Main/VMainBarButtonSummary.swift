import UIKit

class VMainBarButtonSummary:VMainBarButton
{
    private let kImageName:String = "barSummary"
    
    init()
    {
        let title:String = NSLocalizedString("VMainBarButtonSummary_title", comment:"")
        
        super.init(image:kImageName, title:title)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }
}