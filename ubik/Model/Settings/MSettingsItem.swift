import Foundation

class MSettingsItem
{
    let title:String
    let subtitle:String
    let reusableIdentifier:String
    
    init(title:String, subtitle:String, reusableIdentifier:String)
    {
        self.title = title
        self.subtitle = subtitle
        self.reusableIdentifier = reusableIdentifier
    }
}