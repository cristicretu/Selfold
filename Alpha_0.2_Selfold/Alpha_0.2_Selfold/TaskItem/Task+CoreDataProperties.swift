//
//  Task+CoreDataProperties.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 05.07.2021.
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
//    @NSManaged public var points: String?

}


