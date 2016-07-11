import UIKit

class CHistory:CMainController
{
    weak var viewHistory:VHistory!
    
    override func loadView()
    {
        let viewHistory:VHistory = VHistory(controller:self)
        self.viewHistory = viewHistory
        view = viewHistory
    }
}