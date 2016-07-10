import UIKit

class VMainBarButtonConfig:VMainBarButton
{
    private let kImageName:String = "barConfig"
    
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