//
//  WhatsNextView.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 07.07.2021.
//

import SwiftUI
import SwiftUIX

struct WhatsNextView: View {
    // Core Data
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Task.getAllTaskItems()) var TaskItems: FetchedResults<Task>
    
    // Add new task sheet
    @State private var showingSheet = false
    
    var body: some View {
        HStack {
            Text("What's next for you: ")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.top)
            Spacer()
            
            Button(action: {showingSheet.toggle()}, label: {
                VisualEffectBlurView(blurStyle: .systemThinMaterial, vibrancyStyle: .fill, content: {
                    HStack {
                        Text("New")
                        Image(systemName: "plus.circle.fill")
                    }
                })
                .frame(width: 80, height: 30).contentShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.75).fill(Color.white))
                .padding(.top)
                .padding(.trailing)
            })
            .sheet(isPresented: $showingSheet, content: {
                newTaskView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
            })
        }
        
        CardsList()
    }
}

struct WhatsNextView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNextView()
    }
}
