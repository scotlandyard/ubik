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
    
    private func samplePredicate() -> NSPredicate
    {
        let minTimestamp:NSTimeInterval = MSession.sharedInstance.session!.lastDate
        let minDate:NSDate = NSDate(timeIntervalSince1970:minTimestamp)
        let predicate:NSPredicate = HKQuery.predicateForSamplesWithStartDate(minDate, endDate:nil, options:HKQueryOptions.StrictStartDate)
        
        return predicate
    }
    
    private func statisticOptions() -> HKStatisticsOptions
    {
        let options:HKStatisticsOptions = HKStatisticsOptions.CumulativeSum
        
        return options
    }
    
    private func anchorDate() -> NSDate
    {
        let date:NSDate = NSDate().beginningOfDay()
        
        return date
    }
    
    private func intervalComponents() -> NSDateComponents
    {
        let components:NSDateComponents = NSDateComponents()
        components.day = 1
        
        return components
    }
    
    private func loadSteps(model:MHealthModel, delegate:MHealthLoadDelegate)
    {
        let predicate:NSPredicate = samplePredicate()
        let options:HKStatisticsOptions = statisticOptions()
        let startDate:NSDate = anchorDate()
        let components:NSDateComponents = intervalComponents()
        
        let stepsQuery:HKStatisticsCollectionQuery = HKStatisticsCollectionQuery(
            quantityType:stepsType,
            quantitySamplePredicate:predicate,
            options:options,
            anchorDate:startDate,
            intervalComponents:components)
        
        stepsQuery.initialResultsHandler =
        { (query, results, error) in
            
            if results != nil
            {
                let statistics:[HKStatistics] = results!.statistics()
                
                for statistic:HKStatistics in statistics
                {
                    let quantity:HKQuantity? = statistic.sumQuantity()
                    let statisticDate:NSDate = statistic.startDate
                    let timestamp:NSTimeInterval = statisticDate.timeIntervalSince1970
                    let steps:Int32
                    var item:MHealthModelItem?
                    
                    if quantity == nil
                    {
                        steps = 0
                    }
                    else
                    {
                        let stepsDouble:Double = quantity!.doubleValueForUnit(self.stepsUnit)
                        steps = Int32(stepsDouble)
                    }
                    
                    item = model.itemFor(timestamp)
                    
                    if item == nil
                    {
                        item = MHealthModelItem(date:timestamp)
                        model.add(item!)
                    }
                    
                    item!.steps += steps
                }
            }
            
            self.loadDistance(model, delegate:delegate)
        }
        
        healthStore!.executeQuery(stepsQuery)
    }
    
    private func loadDistance(model:MHealthModel, delegate:MHealthLoadDelegate)
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
                    
                    item!.distance += distance
                }
            }
            
            model.getMaxs()
            MSession.sharedInstance.session!.newLastDate(model.lastDate)
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
                let dbModel:DUbikHike = DManager.sharedInstance.managerUbik.untracked(DUbikHike.self)
                dbModel.parse(item!)
                MSession.sharedInstance.session!.newCurrent(dbModel)
            }
            else
            {
                DManager.sharedInstance.managerUbik.createManagedObject(DUbikHike.self)
                { (dbModel) in
                    
                    dbModel.parse(item!)
                    
                    if item === model.maxSteps
                    {
                        MSession.sharedInstance.session!.newMaxSteps(dbModel)
                    }
                    
                    if item === model.maxDistance
                    {
                        MSession.sharedInstance.session!.newMaxDistance(dbModel)
                    }
                }
            }
            
            storeAll(model, delegate:delegate)
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