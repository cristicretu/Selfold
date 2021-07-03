//
//  DateButton.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @ObservedObject var homeData: HomeViewModel
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            
        })
    }
    
}

