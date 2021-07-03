//
//  SelfoldApp.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI

@main
struct SelfoldApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
