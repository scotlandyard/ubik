import UIKit

class MComponentGyroSummary:MComponentGyro
{
    private let kLineWidth:CGFloat = 20
    private let kPointerRadius:CGFloat = 4
    
    init()
    {
        super.init(lineWidth:kLineWidth, pointerRadius:kPointerRadius)
    }
}