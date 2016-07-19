//
//  DUbikHike+CoreDataProperties.swift
//  ubik
//
//  Created by zero on 7/19/16.
//  Copyright © 2016 zero. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DUbikHike {

    @NSManaged var steps: Int32
    @NSManaged var date: NSTimeInterval
    @NSManaged var distance: Int32
    @NSManaged var sessionMaxDistance: DUbikSession?
    @NSManaged var sessionMaxSteps: DUbikSession?

}
