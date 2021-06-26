//
//  ContentView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TaskItem.getAllTaskItems()) var TaskItems:FetchedResults<TaskItem>
    
    @State private var newTaskItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's next for you?")) {
                    HStack {
                        TextField("new Item", text: self.$newTaskItem)
                        Button(action: {
                            let TaskItem = TaskItem(context: self.managedObjectContext)
                            TaskItem.name = self.newTaskItem
                            TaskItem.date = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                fatalError("ii bai")
                            }
                            
                            self.newTaskItem = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("Tasks: ")) {
                    ForEach(self.TaskItems) { taskitem in
                        TaskItemView(name: taskitem.name!, date: "\(taskitem.date!)")
                    }.onDelete {indexset in
                        let deleteItem = self.TaskItems[indexset.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            fatalError("ii bai")
                        }
                        
                    }
                }
            }
            .navigationBarTitle(Text("Welcome back, Cristi"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
