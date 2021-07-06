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
    
    // Task Details
    @State private var newTaskItem = "Go to the dentist"
    @State private var date = Date()
    
    // Add new task sheet
    @State private var showingSheet = false
        
    var charachterLimit = 25
    
    // Remove TextEditor BG in the new sheet
    init() {
            UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            Button(action: {showingSheet.toggle()}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            .sheet(isPresented: $showingSheet, content: {
                messi
            })
        }
        .navigationTitle("Home")
    }
    
    var messi: some View {
        VStack () {
            
            // Sheet title
            Text("Add a new task")
                .font(.title)
                .fontWeight(.bold)
                        
            Text("Task details")
                .font(.headline)
                .padding(.top)
            
            Text("max. 10 words")
                .font(.footnote)
                .opacity(0.5)
            
            TextEditor(text: $newTaskItem)
                .disableAutocorrection(true)
                .padding()
                .background(colorScheme == .dark ? Color.gray.opacity(0.5) : Color.gray.opacity(0.15))
                .frame(width: 150, height: 150)
                .cornerRadius(25)
            
            // Task date
            Text("Task date")
                .font(.headline)
                .padding(.top)
            
            HStack{
                DatePicker("", selection : $date)
                Spacer()
            }
            // For debugging ...
//            Button(action: {print(date)}, label: {Text("hello, World")})
            
            Button(action: {
                 let TaskItem = Task(context: self.managedObjectContext)
                 TaskItem.content = self.newTaskItem
                 TaskItem.date = date

                 do {
                     try self.managedObjectContext.save()
                 } catch {
                     print(error)
                 }

                 self.newTaskItem = ""
                 self.showingSheet = false

             }) {
                 Image(systemName: "plus.circle.fill")
                     .foregroundColor(.green)
                     .imageScale(.large)
             }
                
        }
        .padding()
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
