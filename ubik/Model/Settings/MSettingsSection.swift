import Foundation

class MSettingsSection
{
    let items:[MSettingsItem]
    let title:String
 
    class func Config() -> MSettingsSection
    {
        let section:MSettingsSection = MSettingsSectionConfig()
        return section
    }
    
    init(items:[MSettingsItem], title:String)
    {
        self.items = items
        self.title = title
    }
    
    //MARK: public
    
    func config(header:VSettingsHeader)
    {
        header.label.text = title
    }
}