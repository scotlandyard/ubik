import UIKit

class VMainBarButtonHistory:VMainBarButton
{
    private let kImageName:String = "barHistory"
    
    init()
    {
        let title:String = NSLocalizedString("VMainBarButtonHistory_title", comment:"")
        
        super.init(image:kImageName, title:title)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }
}