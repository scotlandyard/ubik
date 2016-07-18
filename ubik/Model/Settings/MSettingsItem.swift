import Foundation

class MSettingsItem
{
    let reusableIdentifier:String
    
    init(reusableIdentifier:String)
    {
        self.reusableIdentifier = reusableIdentifier
    }
    
    //MARK: public
    
    func config(cell:VSettingsCell, controller:CSettings)
    {
    }
}