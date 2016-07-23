import UIKit

class MHistoryItemComponentRatio:MHistoryItemComponent<VHistoryChartDisplayCellImage>
{
    let ratio:String
    let title:String
    private let kCellHeight:CGFloat = 200
    
    init(ratio:String)
    {
        let measure:String
        
        switch MConfiguration.sharedInstance.device!.measures
        {
            case DUbikDevice.DUbikDeviceMeasures.Metric:
                
                measure = NSLocalizedString("MHistoryItemComponentRatio_measureMetric", comment:"")
                
                break
                
            case DUbikDevice.DUbikDeviceMeasures.Imperial:
                
                measure = NSLocalizedString("MHistoryItemComponentRatio_measureImperial", comment:"")
                
                break
        }
        
        title = String(format:NSLocalizedString("MHistoryItemComponentRatio_title", comment:""), measure)
        self.ratio = ratio
        
        super.init(cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCellImage)
    {
        cell.label.text = ratio
        cell.title.text = title
    }
}