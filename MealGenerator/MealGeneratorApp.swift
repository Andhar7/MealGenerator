//
//  MealGeneratorApp.swift
//  MealGenerator
//
//  Created by Andrej Kling on 15.11.20.
//

import SwiftUI

@main
struct MealGeneratorApp: App {
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") private  var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            
            //ContentView()
            
            TabView {
                NavigationView {
                    ModesScreen()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
          //  .preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(.primary)
        }
    }
}
