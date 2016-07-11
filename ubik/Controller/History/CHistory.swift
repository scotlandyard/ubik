import UIKit

class CHistory:CMainController
{
    weak var model:MSummary!
    weak var viewHistory:VHistory!
    
    convenience init(model:MSummary)
    {
        self.init()
        self.model = model
    }
    
    override func loadView()
    {
        let viewHistory:VHistory = VHistory(controller:self)
        self.viewHistory = viewHistory
        view = viewHistory
    }
}