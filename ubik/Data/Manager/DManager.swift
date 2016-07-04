//
//  DManager.swift
//  Suggestic4
//
//  Created by zero on 6/28/16.
//  Copyright © 2016 Suggestic. All rights reserved.
//

import Foundation

class DManager
{
    static let sharedInstance = DManager()
    let managerSession:DManagerModelSession
    
    private init()
    {
        managerSession = DManagerModelSession()
    }
}