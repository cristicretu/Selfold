//
//  HomeViewModel.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    @Published var points = 0
    
    @Published var isNewData = false
    
    let calendar = Calendar.current

    func writeData (context : NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        do {
            try context.save()
            isNewData.toggle()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
