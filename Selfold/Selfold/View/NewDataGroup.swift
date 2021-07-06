//
//  NewDataGroup.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI
import CoreData

struct NewDataGroup: View {
    @ObservedObject var homeData : HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("Add a new task")
                    .fontWeight(.medium)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $homeData.content)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("when")
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack {
                DateButton(title: "Today", homeData: homeData)
                DatePicker("", selection: $homeData.date)
                    .labelsHidden()
            }
             
            Spacer(minLength: 0)
            
//            Button(action: {homeData.writeData(context: context)}, label: {
//                Label(
//                    title: {Text("Add a new task") },
//                    icon: { Image(systemName: "plus")
//                        .foregroundColor(.green)
//                    }
//                )
//                .padding(.vertical)
//                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 30)
//            })
            
            .disabled(homeData.content == "" ? true : false)
            
            .opacity(homeData.content == "" ? 0.5 : 1)
        }
    }
}
