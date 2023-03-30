//
//  TODO_appApp.swift
//  TODO-app
//
//  Created by Calin Rafa on 28.03.2023.
//

import SwiftUI

@main
struct TODO_appApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
