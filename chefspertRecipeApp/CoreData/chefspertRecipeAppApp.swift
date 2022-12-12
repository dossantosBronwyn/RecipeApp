//
//  chefspertRecipeAppApp.swift
//  chefspertRecipeApp
//
//  Created by Bronwyn dos Santos on 2022/12/12.
//

import SwiftUI

@main
struct chefspertRecipeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
