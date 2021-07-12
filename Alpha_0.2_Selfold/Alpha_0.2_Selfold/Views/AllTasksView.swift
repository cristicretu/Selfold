//
//  AllTasksView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 12.07.2021.
//

import SwiftUI

struct AllTasksView: View {
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        if TaskItems.isEmpty == false {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 16) {
                    ForEach(TaskItems) { item in
                        TaskCard(content: item.content!, date: item.date!, points: Int(item.points), comp: item.isCompleted)
                            .contextMenu() {
                                Button(action: {
                                    self.managedObjectContext.delete(item)
                                    do {
                                        try self.managedObjectContext.save()
                                    } catch {
                                        print(error)
                                    }
                                }, label: HStack {
                                    Text("Delete task")
                                    Spacer()
                                    Image(.system("trash"))
                                })
                            }
                    }
                }
            }
        }
        else {
            Text("You don't have any tasks, add some using the following button")
        }
        
    }
}

struct AllTasksView_Previews: PreviewProvider {
    static var previews: some View {
        AllTasksView()
    }
}
