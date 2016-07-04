//
//  DObjectSessionExperience+CoreDataProperties.swift
//  ubik
//
//  Created by zero on 7/4/16.
//  Copyright © 2016 zero. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension DObjectSessionExperience {

    @NSManaged var version: String?
    @NSManaged var onboardingDone: Bool

}
