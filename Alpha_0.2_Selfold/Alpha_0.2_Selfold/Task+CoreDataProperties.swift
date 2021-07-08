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
    
    static func getDailyTaskItems() -> NSFetchRequest<Task> {
        let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        fetchRequest.predicate = NSPredicate(format: "date >= %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
//    static func getDailyTaskItems() -> NSFetchRequest<Task> {
//        let request : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
//        let filter = ???
//        let predicate = NSPredicate(format = "", filter)
//        request.predicate = predicate
//        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//        return request
//    }
    
//    static func getAllPoints() -> Int {
//        let request : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
//        print(request)
//        return 5
//    }

//    static func getCompletedPoints() -> NSFetchRequest<Task> {
//
//    }
}
