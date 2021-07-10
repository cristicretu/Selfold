//
//  newTaskView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 07.07.2021.
//

import SwiftUI
import SwiftUIX

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
    @State private var isCompleted = false
    
    @State private var pointsInt = 10.0
    
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
            Text("Task points")
            HStack {
                Text("1")
                Slider(value: $pointsInt, in: 1...25, step: 1)
                Text("25")
            }
            Text(Int(pointsInt) == 1 ? "1 point" : "\(Int(pointsInt)) points")
            // - - - - - - - Task points
            
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
                TaskItem.points = Int64(pointsInt)
                TaskItem.isCompleted = false

                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }

                self.newTaskItem = ""
                presentationMode.wrappedValue.dismiss()

                }, label: {
                VisualEffectBlurView(blurStyle: .systemThinMaterial, vibrancyStyle: .fill, content: {
                    HStack {
                        Text("Save")
                        Image(systemName: "plus.circle.fill")
                    }
                })
                .frame(width: 80, height: 30).contentShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.75).fill(Color.white))
                .padding(.top)
                .padding(.trailing)
            })
            // - - - - - - - Task save
        }
        .padding()    }
}
