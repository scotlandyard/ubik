import Foundation

class MSettingsItemNotifications:MSettingsItem
{
    let title:String
    let subtitle:String
    
    init()
    {
        title = NSLocalizedString("MSettingsItemNotifications_title", comment:"")
        subtitle = NSLocalizedString("MSettingsItemNotifications_subtitle", comment:"")
        let reusableIdentifier:String = VSettingsCellCheck.reusableIdentifier()
        
        super.init(reusableIdentifier:reusableIdentifier)
    }
    
    override func config(cell:VSettingsCell, controller:CSettings)
    {
        let cellCheck:VSettingsCellCheck = cell as! VSettingsCellCheck
        
        let attrTitle:NSAttributedString = NSAttributedString(string:title, attributes:cellCheck.attrTitle)
        let attrSubtitle:NSAttributedString = NSAttributedString(string:subtitle, attributes:cellCheck.attrSubtitle)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.appendAttributedString(attrTitle)
        mutableString.appendAttributedString(attrSubtitle)
        
        cellCheck.label.attributedText = mutableString
    }
}