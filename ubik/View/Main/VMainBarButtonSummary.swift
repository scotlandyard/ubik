import UIKit

class VMainBarButtonSummary:VMainBarButton
{
    private let kImageName:String = "barSummary"
    
    init()
    {
        super.init(image:kImageName, title:nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }
}