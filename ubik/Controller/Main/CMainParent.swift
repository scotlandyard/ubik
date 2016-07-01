import UIKit
import Metal

class CMainParent:UIViewController
{
    init()
    {
        let welcomeController:CSuggesticWelcome = CSuggesticWelcome()
        current = welcomeController
        
        super.init(nibName:nil, bundle:nil)
        
        interaction.controller = self
        addChildViewController(welcomeController)
        welcomeController.view.frame = view.bounds
        view.addSubview(welcomeController.view)
        welcomeController.didMoveToParentViewController(self)
    }
    
    required init?(coder aDecoder:NSCoder?)
    {
        fatalError()
    }
}