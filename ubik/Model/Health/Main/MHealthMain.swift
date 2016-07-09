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
    
    private func storeSteps(samples:[HKSample], delegate:MHealthMainDelegate?)
    {
        for sample:HKSample in samples
        {
            
        }
        
        delegate?.healthStepsSaved()
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
    
    func loadStepsHistory(delegate:MHealthMainDelegate?)
    {
        let now:NSDate = NSDate()
        let dateComponents:NSDateComponents = NSDateComponents()
        dateComponents.day = -1
        let calendar:NSCalendar = NSCalendar(identifier:NSCalendarIdentifierGregorian)!
        let yesterday:NSDate = calendar.dateByAddingComponents(dateComponents, toDate:now, options:NSCalendarOptions(rawValue:0))!
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(nil, endDate:yesterday, options:HKQueryOptions.StrictEndDate)
        
        let sampleQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType!,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { [weak self] (query, results, error) in
            
            if error == nil && results != nil
            {
                self?.storeSteps(results!, delegate:delegate)
            }
            else
            {
                var errorString:String? = error?.localizedDescription
                
                if errorString == nil
                {
                    errorString = NSLocalizedString("MHealthMain_stepsError", comment:"")
                }
                
                delegate?.healthStepsError(errorString!)
            }
        }
        
        healthStore!.executeQuery(sampleQuery)
    }
    
    func currentSteps()
    {
        
    }
}