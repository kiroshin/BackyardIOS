//
//  BackyardApp.swift
//  Backyard
//
//  Created by Kiro on 2024/07/26.
//

import SwiftUI

@main
struct BackyardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
