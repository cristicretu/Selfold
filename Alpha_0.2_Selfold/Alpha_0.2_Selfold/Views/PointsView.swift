//
//  PointsView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 08.07.2021.
//

import SwiftUI

struct PointsView: View {
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
//    @FetchRequest(fetchRequest: Task.getDailyTaskItems()) var TaskItems: FetchedResults<Task>
    
    var test = Task.getDailyPoints()
    // number of points
    let totalPoints = 0
    let currentPoints = 0
    
    @State private var isCompleted = false
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Today's goal: ")
                Text("Keep pushing, you got this")
                    .font(.footnote)
                    .opacity(0.5)
            }
            
            Spacer()
            
//            Text("14 / 45 POINTS")
            Text("\(test) / \(totalPoints) POINTS")
        }
        .padding(.trailing)
        .padding(.top)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
