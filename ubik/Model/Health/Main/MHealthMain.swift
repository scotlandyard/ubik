import Foundation
import HealthKit

class MHealthMain
{
    static let sharedInstance = MHealthMain()
    let healthStore:HKHealthStore?
    let stepsType:HKQuantityType?
    
    private init()
    {
        if HKHealthStore.isHealthDataAvailable()
        {
            healthStore = HKHealthStore()
            stepsType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
        }
        else
        {
            healthStore = nil
            stepsType = nil
        }
    }
    
    //MARK: private
    
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
    
    func askAuthorization(delegate:MHealthMainDelegate?)
    {
        let readTypes:Set<HKObjectType> = Set(arrayLiteral:stepsType!)
        
        healthStore!.requestAuthorizationToShareTypes(nil, readTypes:readTypes)
        { (done, error) in
            
            delegate?.healthAuthorizationAsked()
        }
    }
    
    func currentSteps()
    {
        
    }
}