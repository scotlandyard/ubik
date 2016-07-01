//
//  VSummary.swift
//  ubik
//
//  Created by zero on 7/1/16.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit

class VSummary:UIView
{
    weak var controller:CSummary!
    
    convenience init(controller:CSummary)
    {
        self.init()
        clipsToBounds = true
        backgroundColor = UIColor.whiteColor()
        self.controller = controller
    }
}