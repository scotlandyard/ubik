import UIKit

@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate
{
    var window:UIWindow?
    private weak var parent:CMainParent!

    func application(application:UIApplication, didFinishLaunchingWithOptions launchOptions:[NSObject:AnyObject]?) -> Bool
    {
        let window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.whiteColor()
        
        let parent:CMainParent = CMainParent()
        window.rootViewController = parent
        self.window = window
        
        return true
    }
    
    func applicationDidEnterBackground(application:UIApplication)
    {
        UILocalNotification.postRemainder()
    }
    
    func applicationDidBecomeActive(application:UIApplication)
    {
        NSNotification.postBecameActive()
        UILocalNotification.cancelAll()
    }
    
    func applicationWillTerminate(application:UIApplication)
    {
        UILocalNotification.postRemainder()
    }
}