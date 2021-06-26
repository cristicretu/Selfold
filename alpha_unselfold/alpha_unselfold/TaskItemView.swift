//
//  TaskItemView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI

struct TaskItemView: View {
    var name: String = ""
    var date: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(date)
                    .font(.caption)
            }
        }
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(name: "Go outside", date: "26/07/2021 19:27")
    }
}
