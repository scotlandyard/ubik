//
//  CSummary.swift
//  ubik
//
//  Created by zero on 7/1/16.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit

class CSummary:CMainController
{
    weak var vSummary:VSummary!
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(animated)
        
        vSummary.update(100, maxValue:380)
        
        if MHealthMain.sharedInstance.healthStore != nil
        {
            MHealthMain.sharedInstance.currentSteps()
        }
    }
    
    override func loadView()
    {
        let vSummary:VSummary = VSummary(controller:self)
        self.vSummary = vSummary
        view = vSummary
    }
}