//
//  PawFredApp.swift
//  PawFred
//
//  Created by Joana Levtcheva on 17/07/2024.
//

import SwiftUI

@main
struct PawFredApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PetProfileView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
