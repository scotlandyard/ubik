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
    let stepsType:HKQuantityType?
    private(set) var authorized:Bool
    
    private init()
    {
        authorized = false
        
        if HKHealthStore.isHealthDataAvailable()
        {
            healthStore = HKHealthStore()
            stepsType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
            storeLoaded()
        }
        else
        {
            healthStore = nil
            stepsType = nil
        }
    }
    
    //MARK: private
    
    private func storeLoaded()
    {
        let readTypes:Set<HKObjectType> = Set(arrayLiteral:stepsType!)
        
        healthStore!.requestAuthorizationToShareTypes(nil, readTypes:readTypes)
        { [unowned self] (done, error) in
            
            if done
            {
                self.authorized = true
                
                self.querySteps()
            }
        }
    }
    
    private func querySteps()
    {
        
        let sampleQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType!,
            predicate:nil,
            limit:10,
            sortDescriptors:nil)
        { [unowned self] (query, results, error) in
            
            if error != nil
            {
                print("error \(error)")
            }
            else
            {
                if results != nil
                {
                    for result in results!
                    {
                        print(result)
                    }
                }
            }
        }
        
        healthStore!.executeQuery(sampleQuery)
    }
    
    //MARK: public
    
    func currentSteps()
    {
        
    }
}