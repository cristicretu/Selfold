//
//  Task+CoreDataProperties.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 07.07.2021.
//
//

import Foundation
import CoreData

extension Task {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
//        return NSFetchRequest<Task>(entityName: "Task")
//    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var taskPoints: String?
    @NSManaged public var isCompleted: Bool
    
    @NSManaged public var points: Int64

}

extension Task : Identifiable {
    
    static func getAllTaskItems() -> NSFetchRequest<Task> {
        let request : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    
    // function to create new date with same year,month, day as TODAY and time 0:0:0
    // BASICALLY TODAY
    static func createDailyDate(date : Date) -> Date {
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        guard let newDate = Calendar.current.date(from: dateComponents) else { return Date() }
        return newDate
    }
    
    static func getDailyTaskItems() -> NSFetchRequest<Task> {
        let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: createDailyDate(date: Date()))
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", Date().addingTimeInterval(-10 * 60) as CVarArg,  nextDay! as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    static func getDailyTotalPoints() -> Int {
        let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let newDate = createDailyDate(date: Date())
        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: createDailyDate(date: Date()))
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", newDate as CVarArg, nextDay! as CVarArg)

        let records = try! context.fetch(fetchRequest) as! [NSManagedObject]

        let monthlyIncome = records.reduce(0) { $0 + ($1.value(forKey: "value") as? Int64 ?? 0) }
        
        var totalPoints = 0
        return totalPoints
    }

//    static func getCompletedPoints() -> NSFetchRequest<Task> {
//
//    }
}
