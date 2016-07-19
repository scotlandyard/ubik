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
    let calendar:NSCalendar
    let calendarUnits:NSCalendarUnit
    
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
        calendar = NSCalendar.currentCalendar()
        calendarUnits = [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day]
    }
    
    //MARK: private
    
    private func normalizedTimestamp(date:NSDate) -> NSTimeInterval
    {
        let components:NSDateComponents = self.calendar.components(self.calendarUnits, fromDate:date)
        let normalizedDate:NSDate = self.calendar.dateFromComponents(components)!
        let timestamp:NSTimeInterval = normalizedDate.timeIntervalSince1970
        
        return timestamp
    }
    
    private func predicateFor(minTimestamp:NSTimeInterval) -> NSPredicate
    {
        let minDate:NSDate = NSDate(timeIntervalSince1970:minTimestamp)
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(minDate, endDate:nil, options:HKQueryOptions.StrictStartDate)
        
        return predicate
    }
    
    private func loadSteps(model:MHealthModel, delegate:MHealthLoadDelegate)
    {
        let minTimestamp:NSTimeInterval = MSession.sharedInstance.session!.lastDate
        let predicate:NSPredicate = predicateFor(minTimestamp)
        let stepsQuery:HKSampleQuery = HKSampleQuery(
            sampleType:stepsType,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { (query, results, error) in
            
            let rawSteps:[HKQuantitySample]? = results as? [HKQuantitySample]
            
            if rawSteps != nil
            {
                for rawStep:HKQuantitySample in rawSteps!
                {
                    let stepsDouble:Double = rawStep.quantity.doubleValueForUnit(self.stepsUnit)
                    let steps:Int32 = Int32(stepsDouble)
                    let date:NSDate = rawStep.startDate
                    let timestamp:NSTimeInterval = self.normalizedTimestamp(date)
                    var item:MHealthModelItem? = model.itemFor(timestamp)
                    
                    if item == nil
                    {
                        item = MHealthModelItem(date:timestamp)
                        model.add(item!)
                    }
                    
                    item!.steps = steps
                }
            }
            
            self.loadDistance(model, delegate:delegate, predicate:predicate)
        }
        
        healthStore!.executeQuery(stepsQuery)
    }
    
    private func loadDistance(model:MHealthModel, delegate:MHealthLoadDelegate, predicate:NSPredicate)
    {
        let stepsQuery:HKSampleQuery = HKSampleQuery(
            sampleType:distanceType,
            predicate:predicate,
            limit:0,
            sortDescriptors:nil)
        { (query, results, error) in
            
            let rawDistances:[HKQuantitySample]? = results as? [HKQuantitySample]
            
            if rawDistances != nil
            {
                for rawDistance:HKQuantitySample in rawDistances!
                {
                    let distanceDouble:Double = rawDistance.quantity.doubleValueForUnit(self.distanceUnit)
                    let distance:Int32 = Int32(distanceDouble)
                    let date:NSDate = rawDistance.startDate
                    let timestamp:NSTimeInterval = self.normalizedTimestamp(date)
                    var item:MHealthModelItem? = model.itemFor(timestamp)
                    
                    if item == nil
                    {
                        item = MHealthModelItem(date:timestamp)
                        model.add(item!)
                    }
                    
                    item!.distance = distance
                }
            }
            
            model.getMaxs()
            self.storeAll(model, delegate:delegate)
        }
        
        healthStore!.executeQuery(stepsQuery)
    }
    
    private func storeAll(model:MHealthModel, delegate:MHealthLoadDelegate)
    {
        let item:MHealthModelItem? = model.pop()
        
        if item == nil
        {
            DManager.sharedInstance.managerUbik.saver.save(false)
            delegate.healthLoadFinished()
        }
        else
        {
            if item === model.today
            {
                let dbModel:DUbikHike = DUbikHike()
                MSession.sharedInstance.newCurrent(dbModel)
            }
            else
            {
                DManager.sharedInstance.managerUbik.createManagedObject(DUbikHike.self)
                { (dbModel) in
                    
                    if item === model.maxSteps
                    {
                        MSession.sharedInstance.newMaxSteps(dbModel)
                    }
                    
                    if item === model.maxDistance
                    {
                        MSession.sharedInstance.newMaxDistance(dbModel)
                    }
                }
                
                storeAll(model, delegate:delegate)
            }
        }
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
        let today:NSDate = NSDate()
        let threshold:NSTimeInterval = normalizedTimestamp(today)
        let model:MHealthModel = MHealthModel(threshold:threshold)
        loadSteps(model, delegate:delegate)
    }
}