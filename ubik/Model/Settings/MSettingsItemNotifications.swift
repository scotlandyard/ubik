import Foundation

class MSettingsItemNotifications:MSettingsItem
{
    init()
    {
        let title:String = NSLocalizedString("", comment:"")
        let subtitle:String = NSLocalizedString("", comment:"")
        let reusableIdentifier:String = NSLocalizedString("", comment:"")
        
        super.init(title:title, subtitle:subtitle, reusableIdentifier:reusableIdentifier)
    }
}