import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window:UIWindow?
    private weak var parent:CMainParent?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.whiteColor()
        window.rootViewController = CMainParent()
        
        self.window = window
        
        return true
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

}