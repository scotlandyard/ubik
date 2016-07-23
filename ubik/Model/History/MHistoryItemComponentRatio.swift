import UIKit

class MHistoryItemComponentRatio:MHistoryItemComponent
{
    let ratio:String
    let title:String
    private let kCellHeight:CGFloat = 100
    
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
        let reusableIdentifier:String = VHistoryChartDisplayCellImage.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VHistoryChartDisplayCell)
    {
        let cellImage:VHistoryChartDisplayCellImage = cell as! VHistoryChartDisplayCellImage
        cellImage.label.text = ratio
        cellImage.title.text = title
    }
}