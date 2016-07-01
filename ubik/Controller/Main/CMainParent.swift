import UIKit

class CMainParent:UIViewController
{
    let dManager:DManager = DManager()
    
    override func viewDidLoad()
    {
        let level:DModelLevel = dManager.fetchLevel()
        level.steps += 1
        dManager.saveContext()
    }
}