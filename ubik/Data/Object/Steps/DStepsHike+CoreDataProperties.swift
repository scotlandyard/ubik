//
//  DStepsHike+CoreDataProperties.swift
//  ubik
//
//  Created by zero on 7/8/16.
//  Copyright © 2016 zero. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DStepsHike {

    @NSManaged var day: NSTimeInterval
    @NSManaged var amount: Int16
    @NSManaged var milestone: Bool

}
