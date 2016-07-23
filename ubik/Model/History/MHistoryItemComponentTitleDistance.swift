import UIKit

class MHistoryItemComponentTitleDistance:MHistoryItemComponent
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
        
        let reusableIdentifier:String = VHistoryChartDisplayCellDate.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellAmount:VHistoryChartDisplayCellAmount = cell as! VHistoryChartDisplayCellAmount
        cellAmount.label.text = title
    }
}