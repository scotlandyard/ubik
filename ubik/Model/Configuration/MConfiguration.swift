import MConfiguration

class MConfiguration
{
    let firstTime:Bool
    private let kAppVersionName:String = "CFBundleShortVersionString"
    
    init()
    {
        let currentVersion:String = NSBundle.mainBundle().objectForInfoDictionaryKey(kAppVersionName) as! String
    }
}