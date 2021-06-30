//
//  TaskItemView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI
import CoreData

struct TaskItemView: View {
    var name: String = ""
    var date: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Circle()
                .frame(width: 44.0, height: 44.0)
            Text("\(name)")
                .font(.title)
                .fontWeight(.bold)
            Text("\(date)")
        }
        .background(Color.blue)
        .cornerRadius(20.0)
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(name: "Go outside", date: "26/07/2021 19:27")
    }
}
