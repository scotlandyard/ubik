import UIKit

class MComponentGyroSummary:MComponentGyro
{
    private let kLineWidth:CGFloat = 15
    
    init()
    {
        super.init(value:0, maxValue:0, lineWidth:kLineWidth)
    }
    
    init(value:CGFloat, maxValue:CGFloat)
    {
        super.init(value:value, maxValue:maxValue, lineWidth:kLineWidth)
    }
}