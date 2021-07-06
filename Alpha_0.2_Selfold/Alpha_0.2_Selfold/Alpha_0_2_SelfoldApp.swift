//
//  Alpha_0_2_SelfoldApp.swift
//  Alpha_0.2_Selfold
//
//  Created by Cristi Cretu on 05.07.2021.
//

import SwiftUI

@main
struct Alpha_0_2_SelfoldApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
