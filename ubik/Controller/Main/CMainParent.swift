import UIKit

class CMainParent:UIViewController
{
    let dManager:DManager = DManager()
    
    override func viewDidLoad()
    {
        let level:DModelLevel = dManager.fetchLevel()
        print("current level:\(level.steps)")
        
        level.steps += 1
        dManager.saveContext()
    }
}