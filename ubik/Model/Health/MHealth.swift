import Foundation
import HealthKit

class MHealth
{
    static let sharedInstance = MHealth()
    let healthStore:HKHealthStore?
    let stepsType:HKQuantityType
    let stepsUnit:HKUnit
    let distanceType:HKQuantityType
    let distanceUnit:HKUnit
    
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
        distanceType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!
        distanceUnit = HKUnit.meterUnit()
    }
    
    //MARK: private
    
    private func storeSteps(samples:[HKQuantitySample], lastHike:NSTimeInterval, delegate:MHealthStepsDelegate?)
    {
        let calendar:NSCalendar = NSCalendar.currentCalendar()
        let calendarUnits:NSCalendarUnit = [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day]
        var hikes:[MHealthHike] = []
        var hike:MHealthHike?
        
        for sample:HKQuantitySample in samples
        {
            let count:Int32 = Int32(sample.quantity.doubleValueForUnit(stepsUnit))
            let date:NSDate = sample.startDate
            let components:NSDateComponents = calendar.components(calendarUnits, fromDate:date)
            let normalizedDate:NSDate = calendar.dateFromComponents(components)!
            let timestamp:NSTimeInterval = normalizedDate.timeIntervalSince1970
            
            if hike != nil
            {
                if hike!.timestamp == timestamp
                {
                    hike!.add(count)
                }
                else
                {
                    hike = nil
                }
            }
            
            if hike == nil
            {
                hike = MHealthHike(timestamp:timestamp, amount:count)
                hikes.append(hike!)
            }
        }
        
        for inHike:MHealthHike in hikes
        {
            let timestamp:NSTimeInterval = inHike.timestamp
            let amount:Int32 = inHike.amount
            
            MHike.sharedInstance.newHike(timestamp, amount:amount)
        }
        
        MConfiguration.sharedInstance.updateLastHike(lastHike)
        delegate?.healthStepsSaved()
    }
    
    //MARK: public
    
    func askAuthorization(delegate:MHealthAuthDelegate)
    {
        let readTypes:Set<HKObjectType> = Set(arrayLiteral:stepsType, distanceType)
        
        healthStore!.requestAuthorizationToShareTypes(nil, readTypes:readTypes)
        { (done, error) in
            
            delegate.healthAuthorizationAsked()
        }
    }
    
    func loadAll(delegate:MHealthLoadDelegate)
    {
        
    }
    
    
    
    
    
    
    
    
    
    
    func loadStepsHistory(delegate:MHealthStepsDelegate)
    {
        let today:NSDate = NSDate().beginningOfDay()
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(nil, endDate:today, options:HKQueryOptions.StrictStartDate)
        let todayTimestamp:NSTimeInterval = today.timeIntervalSince1970
        
        let sampleQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { (query, results, error) in
            
            let resultsQuantity:[HKQuantitySample]? = results as? [HKQuantitySample]
            
            if error == nil && resultsQuantity != nil
            {
                self.storeSteps(resultsQuantity!, lastHike:todayTimestamp, delegate:delegate)
            }
            else
            {
                var errorString:String? = error?.localizedDescription
                
                if errorString == nil
                {
                    errorString = NSLocalizedString("MHealthMain_stepsError", comment:"")
                }
                
                delegate.healthStepsError(errorString!)
            }
        }
        
        healthStore!.executeQuery(sampleQuery)
    }
    
    func loadStepsRemaining(delegate:MHealthTodayDelegate)
    {
        let lastTimestamp:NSTimeInterval = MConfiguration.sharedInstance.experience!.lastHike
        let lastLoadedDate:NSDate = NSDate(timeIntervalSince1970:lastTimestamp)
        let today:NSDate = NSDate().beginningOfDay()
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(lastLoadedDate, endDate:nil, options:HKQueryOptions.StrictStartDate)
        let todayTimestamp:NSTimeInterval = today.timeIntervalSince1970
        
        let sampleQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { (query, results, error) in
            
            let resultsQuantity:[HKQuantitySample]? = results as? [HKQuantitySample]
            
            if error == nil && resultsQuantity != nil
            {
                var countToday:Int32 = 0
                var history:[HKQuantitySample] = []
                
                for result:HKQuantitySample in resultsQuantity!
                {
                    let date:NSDate = result.startDate
                    let timestamp:NSTimeInterval = date.timeIntervalSince1970
                    
                    if timestamp < todayTimestamp
                    {
                        history.append(result)
                    }
                    else
                    {
                        let amount:Int32 = Int32(result.quantity.doubleValueForUnit(self.stepsUnit))
                        countToday += amount
                    }
                }
                
                self.storeSteps(history, lastHike:todayTimestamp, delegate:nil)
                delegate.healthTodaySteps(countToday)
            }
            else
            {
                delegate.healthTodaySteps(0)
            }
        }
        
        healthStore!.executeQuery(sampleQuery)
    }
}