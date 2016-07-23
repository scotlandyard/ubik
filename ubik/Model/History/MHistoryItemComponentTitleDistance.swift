import UIKit

class MHistoryItemComponentTitleDistance:MHistoryItemComponent
{
    let title:String
    private let kCellHeight:CGFloat = 18
    
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
        
        let reusableIdentifier:String = VHistoryChartDisplayCellTitle.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellTitle = cell as! VHistoryChartDisplayCellTitle
        cellAmount.label.text = title
    }
}