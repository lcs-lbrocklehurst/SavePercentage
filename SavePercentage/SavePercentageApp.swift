//
//  SavePercentageApp.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-02-11.
//

import SwiftUI

@main
struct SavePercentageApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                SavePercentageView()
                    .tabItem {
                        Label("Calculator", systemImage: "Carrot")
                    }
                
                SavedView()
                    .tabItem {
                        Label("Favourites", systemImage: "list.dash")
                    }
            }
            //Make the database available to all child views through the environment
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
