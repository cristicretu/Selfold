//
//  TaskCard.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 06.07.2021.
//

import SwiftUI
import SwiftUIX

struct TaskCard: View {
    var content = ""
    var date = Date()
    var points = ""
    
    var body: some View {
            VisualEffectBlurView(blurStyle: .systemUltraThinMaterial, vibrancyStyle: .fill, content: {
                Text("\(content)")
//                Text("\(date)")
                Text("\(points)")
            })
            .frame(width: 150, height: 150).contentShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(lineWidth: 0.75).fill(Color.white))
            
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard()
    }
}
