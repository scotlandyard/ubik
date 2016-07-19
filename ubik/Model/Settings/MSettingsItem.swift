import UIKit

class MSettingsItem
{
    let reusableIdentifier:String
    let cellHeight:CGFloat
    
    class func Notifications() -> MSettingsItem
    {
        let item:MSettingsItem = MSettingsItemNotifications()
        
        return item
    }
    
    init(reusableIdentifier:String, cellHeight:CGFloat)
    {
        self.reusableIdentifier = reusableIdentifier
        self.cellHeight = cellHeight
    }
    
    //MARK: public
    
    func config(cell:VSettingsCell, controller:CSettings)
    {
    }
}