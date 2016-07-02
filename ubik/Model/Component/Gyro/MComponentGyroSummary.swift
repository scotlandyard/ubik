import UIKit

class MComponentGyroSummary:MComponentGyro
{
    private let kLineWidth:CGFloat = 15
    private let kPointerRadius:CGFloat = 20
    
    init()
    {
        super.init(value:0, maxValue:0, lineWidth:kLineWidth, pointerRadius:kPointerRadius)
    }
    
    init(value:CGFloat, maxValue:CGFloat)
    {
        super.init(value:value, maxValue:maxValue, lineWidth:kLineWidth, pointerRadius:kPointerRadius)
    }
}