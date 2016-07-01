import UIKit

class MComponentGyroSummary:MComponentGyro
{
    private let kLineWidth:CGFloat = 6
    
    init(value:CGFloat, maxValue:CGFloat)
    {
        super.init(value:value, maxValue:maxValue, lineWidth:kLineWidth)
    }
}