//
//  MHealthMain.swift
//  ubik
//
//  Created by zero on 7/3/16.
//  Copyright © 2016 zero. All rights reserved.
//

import Foundation
import HealthKit

class MHealthMain
{
    static let sharedInstance = MHealthMain()
    let healthStore:HKHealthStore?
    
    private init()
    {
        if HKHealthStore.isHealthDataAvailable()
        {
            healthStore = HKHealthStore()
        }
        else
        {
            healthStore = nil
        }
    }
    
    //MARK: public
    
    func currentSteps()
    {
        let stepsCount = HKQuantityType.quantityTypeForIdentifier(
            HKQuantityTypeIdentifierStepCount)
        
        print("steps: \(stepsCount)")
    }
}