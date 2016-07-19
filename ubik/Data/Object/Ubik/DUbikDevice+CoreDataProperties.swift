//
//  DUbikDevice+CoreDataProperties.swift
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

extension DUbikDevice {

    @NSManaged var onboarded: Bool
    @NSManaged var version: String?
    @NSManaged var notifications: Bool

}
