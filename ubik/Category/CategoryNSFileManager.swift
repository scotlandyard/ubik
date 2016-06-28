//
//  CategoryNSFileManager.swift
//  ubik
//
//  Created by zero on 6/28/16.
//  Copyright © 2016 zero. All rights reserved.
//

import Foundation

extension NSFileManager
{
    class func appDirectory() -> NSURL
    {
        let urls:[NSURL] = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
        let appDirectory:NSURL = urls.last!
        
        return appDirectory
    }
}