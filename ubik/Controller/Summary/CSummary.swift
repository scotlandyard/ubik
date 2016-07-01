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
    override func loadView()
    {
        view = VSummary(controller:self)
    }
}