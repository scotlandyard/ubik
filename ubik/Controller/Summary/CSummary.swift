import UIKit

class CSummary:CMainController
{
    weak var vSummary:VSummary!
    let model:MSummary
    
    init()
    {
        model = MSummary()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        vSummary.update(100, maxValue:380)
    }
    
    override func loadView()
    {
        let vSummary:VSummary = VSummary(controller:self)
        self.vSummary = vSummary
        view = vSummary
    }
}