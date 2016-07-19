import UIKit

class CLanding:CMainController
{
    weak var viewLanding:VLanding!
    
    override func loadView()
    {
        let viewLanding:VLanding = VLanding(controller:self)
        self.viewLanding = viewLanding
        view = viewLanding
    }
}