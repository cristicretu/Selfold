//
//  ContentView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 05.07.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // is Dark Mode ?
    @Environment(\.colorScheme) var colorScheme
    
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    
    // Add new task sheet
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(TaskItems) { item in
                        TaskCard(content: item.content!, date: item.date!)
                            .contextMenu() {
                            Button(action: {
                                self.managedObjectContext.delete(item)
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                            }, label: Text("hello"))
                        }
                    }
                    
                }
                
                Button(action: {showingSheet.toggle()}, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .sheet(isPresented: $showingSheet, content: {
                    newTaskView()
                        .environment(\.managedObjectContext, self.managedObjectContext)
                })
            }
        }
        .navigationTitle("Home")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
