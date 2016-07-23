import UIKit

class MSettingsItemNotifications:MSettingsItem
{
    let title:String
    let subtitle:String
    private let kCellHeight:CGFloat = 90
    
    init()
    {
        title = NSLocalizedString("MSettingsItemNotifications_title", comment:"")
        subtitle = NSLocalizedString("MSettingsItemNotifications_subtitle", comment:"")
        let reusableIdentifier:String = VSettingsCellCheck.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier, cellHeight:kCellHeight)
    }
    
    override func config(cell:VSettingsCell, controller:CSettings)
    {
        let cellCheck:VSettingsCellCheck = cell as! VSettingsCellCheck
        let allowNotifications:Bool = MConfiguration.sharedInstance.device!.notifications
        
        let attrTitle:NSAttributedString = NSAttributedString(string:title, attributes:cellCheck.attrTitle)
        let attrSubtitle:NSAttributedString = NSAttributedString(string:subtitle, attributes:cellCheck.attrSubtitle)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.appendAttributedString(attrTitle)
        mutableString.appendAttributedString(attrSubtitle)
        
        cellCheck.label.attributedText = mutableString
        cellCheck.check.setOn(allowNotifications, animated:false)
        cellCheck.check.addTarget(self, action:#selector(self.actionCheckChange(sender:)), forControlEvents:UIControlEvents.ValueChanged)
    }
    
    //MARK: actions
    
    @objc func actionCheckChange(sender check:UISwitch)
    {
        MConfiguration.sharedInstance.device!.changeNotifications(check.on)
    }
}