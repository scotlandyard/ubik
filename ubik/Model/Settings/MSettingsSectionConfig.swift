import Foundation

class MSettingsSectionConfig:MSettingsSection
{
    init()
    {
        let itemNotifications:MSettingsItem = MSettingsItem.Notifications()
        
        let items:[MSettingsItem] = [
            itemNotifications
        ]
        let title:String = NSLocalizedString("MSettingsSectionConfig_title", comment:"")
        
        super.init(items:items, title:title)
    }
}