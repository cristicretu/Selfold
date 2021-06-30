//
//  TaskItemView.swift
//  alpha_unselfold
//
//  Created by Cristi Cretu on 26.06.2021.
//

import SwiftUI
import CoreData
import SwiftUIX

struct TaskItemView: View {
    var name: String = ""
    var date: String = ""
    
    var body: some View {
        VisualEffectBlurView(blurStyle: .systemUltraThinMaterial, vibrancyStyle: .fill, content: {
            Text("\(name)")
            Text("\(date)")
//          Text("\()")
        })
        .frame(width: 150, height: 150)
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
        
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(name: "Go outside", date: "26/07/2021 19:27")
    }
}
