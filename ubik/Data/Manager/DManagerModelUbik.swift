import Foundation

class DManagerModelUbik:DManagerModel
{
    let kEntity_Device:String = "Device"
    let kEntity_Hike:String = "Hike"
    let kEntity_Session:String = "Session"
    private let kModelName:String = "DUbikModel"
    
    init()
    {
        super.init(modelName:kModelName)
    }
}