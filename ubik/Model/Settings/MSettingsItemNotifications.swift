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
}