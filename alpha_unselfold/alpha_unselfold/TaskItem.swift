//
//  TaskItem.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import Foundation
import CoreData

public class TaskItem: NSManagedObject, Identifiable {
    @NSManaged public var date: Date?
    @NSManaged public var name: String?
//    @NSManaged public var points: Int?
}

extension TaskItem {
    static func getAllTaskItems() -> NSFetchRequest<TaskItem> {
        let request: NSFetchRequest<TaskItem> = TaskItem.fetchRequest() as! NSFetchRequest<TaskItem>
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
