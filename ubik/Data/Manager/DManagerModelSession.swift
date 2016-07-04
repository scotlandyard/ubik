//
//  DManagerModelSession.swift
//  Suggestic4
//
//  Created by zero on 6/28/16.
//  Copyright © 2016 Suggestic. All rights reserved.
//

import Foundation

class DManagerModelSession:DManagerModel
{
    let kEntity_Conf:String = "Conf"
    let kEntity_ConfLocation:String = "ConfLocation"
    let kEntity_ConfMedia:String = "ConfMedia"
    let kEntity_ConfNotifications:String = "ConfNotifications"
    let kEntity_Device:String = "Device"
    let kEntity_Location:String = "Location"
    let kEntity_User:String = "User"
    private let kModelName:String = "DSessionModel"
    
    init()
    {
        super.init(modelName:kModelName)
    }
}