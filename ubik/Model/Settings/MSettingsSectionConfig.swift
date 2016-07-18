import Foundation

class MSettingsSectionConfig:MSettingsSection
{
    init()
    {
        let items:[MSettingsItem] = [
        ]
        let title:String = NSLocalizedString("MSettingsSectionConfig_title", comment:"")
        
        super.init(items:items, title:title)
    }
}