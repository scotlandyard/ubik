import UIKit

class MHistoryItemComponentTitleDistance:MHistoryItemComponent<VHistoryChartDisplayCellTitle>
{
    let title:String
    private let kCellHeight:CGFloat = 40
    
    init()
    {
        switch MConfiguration.sharedInstance.device!.measures
        {
            case DUbikDevice.DUbikDeviceMeasures.Metric:
                
                title = NSLocalizedString("MHistoryItemComponentTitleDistance_titleMetric", comment:"")
                
                break
                
            case DUbikDevice.DUbikDeviceMeasures.Imperial:
                
                title = NSLocalizedString("MHistoryItemComponentTitleDistance_titleImperial", comment:"")
                
                break
        }
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellTitle)
    {
        cell.label.text = title
    }
}