import Foundation

class DManagerModelSteps:DManagerModel
{
    let kEntity_Hike:String = "Hike"
    let kEntity_Hike_Day:String = "day"
    let kEntity_hike_Amount:String = "amount"
    private let kModelName:String = "DStepsModel"
    
    init()
    {
        super.init(modelName:kModelName)
    }
}