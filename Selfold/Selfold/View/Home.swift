//
//  Home.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        Button(action: {homeData.isNewData.toggle()}, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataGroup(homeData: homeData)
        })
    }
}
