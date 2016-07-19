import Foundation

class MSettings
{
    let sections:[MSettingsSection]
    
    init()
    {
        let sectionConfig:MSettingsSection = MSettingsSection.Config()
        
        sections = [
            sectionConfig
        ]
    }
}