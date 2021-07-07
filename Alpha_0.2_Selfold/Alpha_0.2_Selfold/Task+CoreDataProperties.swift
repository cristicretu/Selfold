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
    
    // don't use but without it the app breaks :)
    @NSManaged public var points: Int64

}

extension Task : Identifiable {
    static func getAllTaskItems() -> NSFetchRequest<Task> {
        let request : NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
