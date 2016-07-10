import UIKit

class VMainBarButtonHistory:VMainBarButton
{
    private let kImageName:String = "barHistory"
    
    init()
    {
        super.init(image:kImageName)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError()
    }
}