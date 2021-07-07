//
//  newTaskView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 07.07.2021.
//

import SwiftUI

struct newTaskView: View {
    // Dismiss the view
    @Environment(\.presentationMode) var presentationMode
    
    // is Dark Mode ?
    @Environment(\.colorScheme) var colorScheme
    
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    
    // Task Details
    @State private var newTaskItem = "Go to the dentist"
    @State private var date = Date()
    @State private var points = ""
    
    @State private var pointsInt = 10.0
    @State private var isEditing = false
    
    // Remove TextEditor BG in the new sheet
    init() {
            UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack () {
            Text("Add a new task")
                .font(.title)
                .fontWeight(.bold)
                        
            Text("Task details")
                .font(.headline)
                .padding(.top)
            
            // - - - - - - - Task content
            Text("max. 10 words")
                .font(.footnote)
                .opacity(0.5)
            
            TextEditor(text: $newTaskItem)
                .disableAutocorrection(true)
                .padding()
                .background(colorScheme == .dark ? Color.gray.opacity(0.5) : Color.gray.opacity(0.15))
                .frame(width: 150, height: 150)
                .cornerRadius(25)
            // - - - - - - - Task content
            
            // - - - - - - - Task points
//            HStack {
//                Image(systemName: "minus")
//                Slider(value: $pointsInt, in: 0...20, step: 1)
//                    .onChange(of: self.pointsInt, perform: <#T##(Equatable) -> Void#>)
//                    .accentColor(Color.green)
//                Image(systemName: "plus")
//            }.foregroundColor(Color.green)
            Slider(value: $pointsInt, in: 1...25, step: 1)
            Text("\(pointsInt)")
//            Slider(value: $pointsInt, in: 1...25, step: 1, onEditingChanged: {editing in
//                isEditing = editing
//            })
            // - - - - - - - Task points
            
            
            // !!!!!!! JUST FOR DEBUGGING, REMOVE IN PRODUCTION
            Button(action: {print(pointsInt)}, label: Text("click me"))
            
            // - - - - - - - Task date
            Text("Task date")
                .font(.headline)
                .padding(.top)
            
            HStack{
                DatePicker("", selection : $date)
                Spacer()
            }
            // - - - - - - - Task date
            
            // - - - - - - - Task save
            Button(action: {
                 let TaskItem = Task(context: self.managedObjectContext)
                 TaskItem.content = self.newTaskItem
                 TaskItem.date = date
                
                // Convert Double to String (f)
                var str = String(pointsInt)
                if let dotRange = str.range(of: ".") {
                  str.removeSubrange(dotRange.lowerBound..<str.endIndex)
                }
                if str == "1" {
                    str = str + " point"
                }
                else {
                    str = str + " points"
                }
                TaskItem.taskPoints = str

                
                
                 do {
                     try self.managedObjectContext.save()
                 } catch {
                     print(error)
                 }

                 self.newTaskItem = ""
                 presentationMode.wrappedValue.dismiss()

             })
             {
                 Image(systemName: "plus.circle.fill")
                     .foregroundColor(.green)
                     .imageScale(.large)
             }
            // - - - - - - - Task save
        }
        .padding()    }
}

struct newTaskView_Previews: PreviewProvider {
    static var previews: some View {
        newTaskView()
    }
}
