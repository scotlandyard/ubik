import Foundation
import HealthKit

class MHealthMain
{
    static let sharedInstance = MHealthMain()
    let healthStore:HKHealthStore?
    let stepsType:HKQuantityType
    let stepsUnit:HKUnit
    
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
        
        stepsType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!
        stepsUnit = HKUnit.countUnit()
    }
    
    //MARK: private
    
    private func storeSteps(samples:[HKQuantitySample], delegate:MHealthMainDelegate?)
    {
        let calendar:NSCalendar = NSCalendar.currentCalendar()
        let calendarUnits:NSCalendarUnit = [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day]
        let managerSteps:DManagerModelSteps = DManager.sharedInstance.managerSteps
        
        for sample:HKQuantitySample in samples
        {
            let count:Int16 = Int16(sample.quantity.doubleValueForUnit(stepsUnit))
            let date:NSDate = sample.startDate
            let components:NSDateComponents = calendar.components(calendarUnits, fromDate:date)
            let normalizedDate:NSDate = calendar.dateFromComponents(components)!
            let timestamp:NSTimeInterval = normalizedDate.timeIntervalSince1970
            let hike:DStepsHike = managerSteps.createManagedObject(managerSteps.kEntity_Hike) as! DStepsHike
            hike.day = timestamp
            hike.amount = count
            hike.milestone = false
        }
        
        DManager.sharedInstance.managerSteps.saveContext()
        delegate?.healthStepsSaved()
    }
    
    //MARK: public
    
    func askAuthorization(delegate:MHealthMainDelegate?)
    {
        let readTypes:Set<HKObjectType> = Set(arrayLiteral:stepsType)
        
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
        let calendar:NSCalendar = NSCalendar.currentCalendar()
        let yesterday:NSDate = calendar.dateByAddingComponents(dateComponents, toDate:now, options:NSCalendarOptions(rawValue:0))!
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(nil, endDate:yesterday, options:HKQueryOptions.StrictEndDate)
        
        let sampleQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { [weak self] (query, results, error) in
            
            let resultsQuantity:[HKQuantitySample]? = results as? [HKQuantitySample]
            
            if error == nil && resultsQuantity != nil
            {
                self?.storeSteps(resultsQuantity!, delegate:delegate)
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