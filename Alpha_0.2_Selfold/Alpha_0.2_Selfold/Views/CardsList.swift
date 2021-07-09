//
//  CardsList.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 07.07.2021.
//

import SwiftUI

struct CardsList: View {
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
//    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    @FetchRequest(fetchRequest: Task.getNextTaskItems()) var TaskItems: FetchedResults<Task>
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
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
}

